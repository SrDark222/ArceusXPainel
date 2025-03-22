#!/bin/bash

# Solicita acesso ao armazenamento
termux-setup-storage

# Decoração ASCII
ascii_art() {
    clear
    echo -e "\033[1;35m================================================\033[0m"
    echo -e "\033[1;32m    ᗩ﹒💙ʬʬ﹒ PAINEL ARCEUS X \033[1;33m[Melhorado] \033[0m"
    echo -e "\033[1;35m================================================\033[0m"
}

# Exibir menu principal
menu() {
    ascii_art
    echo -e " \033[1;36m1 - \033[1;33mAdicionar AutoExec Script\033[0m"
    echo -e " \033[1;36m2 - \033[1;33mRemover AutoExec Script\033[0m"
    echo -e " \033[1;36m3 - \033[1;33mLimpar logs do Workspace\033[0m"
    echo -e " \033[1;36m4 - \033[1;33mRemover Abas do Arceus X\033[0m"
    echo -e " \033[1;36m5 - \033[1;33mMinimizar Arceus X\033[0m"
    echo -e " \033[1;31m0 - Sair\033[0m"
    echo -e "\033[1;35m================================================\033[0m"
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

# Função para buscar scripts e exibir lista paginada
buscar_scripts() {
    arquivos=($(find /storage/emulated/0 -type f -iname "*.lua" -o -iname "*.txt" 2>/dev/null | sed 's|.*/||' | tr ' ' '-'))
    
    if [[ ${#arquivos[@]} -eq 0 ]]; then
        echo -e "\033[1;31mNenhum script encontrado!\033[0m"
        sleep 2
        menu
    fi
    
    pagina=1
    while true; do
        clear
        ascii_art
        echo -e "\033[1;36mProcurando scripts Lua...\033[0m"
        echo -e "\033[1;35m==========================\033[0m"
        for i in $(seq $(((pagina-1)*10)) $((pagina*10-1))); do
            [[ -n "${arquivos[i]}" ]] && echo -e "\033[1;36m$((i+1)). \033[1;33m${arquivos[i]}\033[0m"
        done
        echo -e "\033[1;35m==========================\033[0m"
        echo -e "0. Voltar | 🡺 Próxima Página (Digite: >) | 🡸 Página Anterior (Digite: <)"
        echo -ne "\033[1;34mEscolha um script: \033[0m"
        read escolha

        if [[ $escolha == ">" ]]; then
            ((pagina++))
        elif [[ $escolha == "<" && $pagina -gt 1 ]]; then
            ((pagina--))
        elif [[ $escolha -eq 0 ]]; then
            menu
        elif [[ $escolha -ge 1 && $escolha -le ${#arquivos[@]} ]]; then
            echo "${arquivos[$((escolha-1))]}"
            return
        fi
    done
}

# Adicionar AutoExec Script
adicionar_autoexec() {
    ascii_art
    script_escolhido=$(buscar_scripts)
    if [[ -n "$script_escolhido" ]]; then
        mv "/storage/emulated/0/$script_escolhido" "/storage/emulated/0/Arceus X/AutoExec/"
        echo -e "\033[1;32m✅ Script $script_escolhido adicionado ao AutoExec!\033[0m"
        sleep 2
    fi
    menu
}

# Remover AutoExec Script
remover_autoexec() {
    ascii_art
    scripts=($(ls /storage/emulated/0/Arceus\ X/AutoExec/ 2>/dev/null | tr ' ' '-'))
    if [[ ${#scripts[@]} -eq 0 ]]; then
        echo -e "\033[1;31mNenhum script AutoExec encontrado!\033[0m"
        sleep 2
        menu
    fi

    echo -e "\033[1;36mScripts AutoExec disponíveis:\033[0m"
    for i in "${!scripts[@]}"; do
        echo -e "\033[1;36m$((i+1)). \033[1;33m${scripts[i]}\033[0m"
    done
    echo -e "\033[1;35m==========================\033[0m"
    echo -ne "\033[1;34mEscolha um script para remover: \033[0m"
    read escolha

    if [[ $escolha -ge 1 && $escolha -le ${#scripts[@]} ]]; then
        rm "/storage/emulated/0/Arceus X/AutoExec/${scripts[$((escolha-1))]}"
        echo -e "\033[1;32m✅ Script removido com sucesso!\033[0m"
    fi
    sleep 2
    menu
}

# Limpar logs do Workspace
limpar_logs() {
    ascii_art
    rm -rf /storage/emulated/0/Arceus\ X/Workspace/*
    echo -e "\033[1;32m✅ Logs apagados com sucesso!\033[0m"
    sleep 2
    menu
}

# Remover Abas do Arceus X
remover_abas() {
    ascii_art
    rm -f /storage/emulated/0/Arceus\ X/Configs/tabs.ax
    echo -e "\033[1;32m✅ Abas removidas!\033[0m"
    sleep 2
    menu
}

# Minimizar Arceus X
minimizar_arceus() {
    ascii_art
    rm -rf /storage/emulated/0/Android/data/com.arceusx/cache/*
    rm -rf /storage/emulated/0/Android/data/com.arceusx/files/*
    echo -e "\033[1;32m✅ Arceus X minimizado!\033[0m"
    sleep 2
    menu
}

# Executar menu principal
menu
