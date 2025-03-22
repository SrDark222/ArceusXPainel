#!/bin/bash

# Solicita acesso ao armazenamento
termux-setup-storage

# Caminhos das pastas do Arceus X
BASE_DIR="/storage/emulated/0/Arceus X"
WORKSPACE="$BASE_DIR/Workspace"
CONFIGS="$BASE_DIR/Configs"
AUTOEXEC="$BASE_DIR/AutoExec"

# Criar pastas necessárias caso não existam
mkdir -p "$AUTOEXEC"

# Exibir menu principal
menu() {
    clear
    echo -e "\033[1;35m==============================================\033[0m"
    echo -e "\033[1;32m      ᗩ﹒💙ʬʬ﹒ PAINEL ARCEUS X \033[1;33m[v2] \033[0m"
    echo -e "\033[1;35m==============================================\033[0m"
    echo -e " \033[1;36m1 - \033[1;33mAdicionar Script ao AutoExec\033[0m"
    echo -e " \033[1;36m2 - \033[1;33mRemover Script do AutoExec\033[0m"
    echo -e " \033[1;36m3 - \033[1;33mLimpar logs do Workspace\033[0m"
    echo -e " \033[1;36m4 - \033[1;33mRemover abas do Arceus X\033[0m"
    echo -e " \033[1;36m5 - \033[1;33mMinimizar Arceus X\033[0m"
    echo -e " \033[1;31m0 - Sair\033[0m"
    echo -e "\033[1;35m==============================================\033[0m"
    echo -ne " \033[1;34mEscolha uma opção: \033[0m"
    read opcao
    case $opcao in
        1) adicionar_autoexec ;;
        2) remover_autoexec ;;
        3) limpar_logs ;;
        4) remover_abas ;;
        5) minimizar_arceus ;;
        0) exit ;;
        *) echo -e "\033[1;31mOpção inválida!\033[0m" && sleep 1 && menu ;;
    esac
}

# Buscar scripts na pasta de downloads
buscar_scripts() {
    arquivos=($(find /storage/emulated/0/Download -type f -iname "*.lua" -o -iname "*.txt" 2>/dev/null))

    if [[ ${#arquivos[@]} -eq 0 ]]; then
        echo -e "\033[1;31mNenhum script encontrado!\033[0m"
        sleep 2
        menu
    fi

    echo -e "\033[1;36mScripts disponíveis:\033[0m"
    for i in "${!arquivos[@]}"; do
        nome=$(basename "${arquivos[i]}")
        echo -e "\033[1;36m$((i+1)). \033[1;33m$nome\033[0m"
    done
    echo -e "\033[1;35m==============================================\033[0m"
    echo -ne "\033[1;34mEscolha um script para adicionar ao AutoExec: \033[0m"
    read escolha

    if [[ $escolha -ge 1 && $escolha -le ${#arquivos[@]} ]]; then
        arquivo_escolhido="${arquivos[$((escolha-1))]}"
        nome_arquivo=$(basename "$arquivo_escolhido" | tr ' ' '-')  
        destino="$AUTOEXEC/$nome_arquivo"
        
        # Mover o arquivo e dar permissões
        mv -f "$arquivo_escolhido" "$destino"
        chmod 777 "$destino"

        if [[ -f "$destino" ]]; then
            echo -e "\033[1;32m✅ Script '$nome_arquivo' adicionado ao AutoExec!\033[0m"
        else
            echo -e "\033[1;31m❌ Erro ao mover o arquivo!\033[0m"
        fi
        sleep 2
    fi
    menu
}

# Adicionar script ao AutoExec
adicionar_autoexec() {
    buscar_scripts
}

# Remover script do AutoExec
remover_autoexec() {
    scripts=($(ls "$AUTOEXEC" 2>/dev/null))
    
    if [[ ${#scripts[@]} -eq 0 ]]; then
        echo -e "\033[1;31mNenhum script AutoExec encontrado!\033[0m"
        sleep 2
        menu
    fi

    echo -e "\033[1;36mScripts AutoExec disponíveis:\033[0m"
    for i in "${!scripts[@]}"; do
        echo -e "\033[1;36m$((i+1)). \033[1;33m${scripts[i]}\033[0m"
    done
    echo -e "\033[1;35m==============================================\033[0m"
    echo -ne "\033[1;34mEscolha um script para remover: \033[0m"
    read escolha

    if [[ $escolha -ge 1 && $escolha -le ${#scripts[@]} ]]; then
        rm -f "$AUTOEXEC/${scripts[$((escolha-1))]}"
        echo -e "\033[1;32m✅ Script removido com sucesso!\033[0m"
    fi
    sleep 2
    menu
}

# Limpar logs do Workspace
limpar_logs() {
    rm -rf "$WORKSPACE"/*
    echo -e "\033[1;32m✅ Logs apagados!\033[0m"
    sleep 2
    menu
}

# Remover abas do Arceus X (somente o arquivo tabs.ax)
remover_abas() {
    rm -f "$CONFIGS/tabs.ax"
    echo -e "\033[1;32m✅ Abas removidas!\033[0m"
    sleep 2
    menu
}

# Minimizar Arceus X (limpando cache e arquivos temporários)
minimizar_arceus() {
    rm -rf /storage/emulated/0/Android/data/com.arceusx/cache/*
    rm -rf /storage/emulated/0/Android/data/com.arceusx/files/*
    echo -e "\033[1;32m✅ Arceus X minimizado!\033[0m"
    sleep 2
    menu
}

# Executar menu
menu
