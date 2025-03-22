#!/bin/bash

# 🚀 Solicita permissão de armazenamento no Termux
termux-setup-storage

# 🔹 Simbolos decorativos
linha="\033[1;35m⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒\033[0m"
decor1="⊹˚.⋆ ₊꒷ᘏᘏ︶ଓ︶꒷꒦⊹˚ᗢ₊꒷︶ଓ︶꒷"
decor2="☆ : ୨🔵୧ ᗢ ₊꒷︶ଓ︶꒷"

# 🌟 Menu Principal
menu() {
    clear
    echo -e "\033[1;35m================================================\033[0m"
    echo -e "\033[1;36m          💠 PAINEL ARCEUS X \033[1;33m[ᗩ Melhorado]\033[0m"
    echo -e "\033[1;35m================================================\033[0m"
    echo -e "        $decor1"
    echo -e "\033[1;36m 1 - \033[1;33mAdicionar AutoExec Script 🔹\033[0m"
    echo -e "\033[1;36m 2 - \033[1;33mRemover AutoExec Script 🔸\033[0m"
    echo -e "\033[1;36m 3 - \033[1;33mLimpar logs do Workspace 🧹\033[0m"
    echo -e "\033[1;36m 4 - \033[1;33mRemover Abas do Arceus X ❌\033[0m"
    echo -e "\033[1;36m 5 - \033[1;33mMinimizar Arceus X ⚡\033[0m"
    echo -e "\033[1;36m 0 - \033[1;31mSair 🚪\033[0m"
    echo -e "        $decor2"
    echo -e "$linha"
    echo -n -e "\033[1;34mEscolha uma opção: \033[0m"
    read opcao

    case $opcao in
        1) buscar_scripts ;;  # Corrigido!
        2) remover_autoexec ;;
        3) limpar_logs ;;
        4) remover_abas ;;
        5) minimizar_arceus ;;
        0) exit ;;
        *) echo -e "\033[1;31mOpção inválida!\033[0m" && sleep 1 && menu ;;
    esac
}

# 🔎 Função para buscar scripts `.lua` primeiro e `.txt` depois
buscar_scripts() {
    clear
    echo -e "\033[1;36m🔍 Procurando scripts...\033[0m"
    sleep 1

    # Busca arquivos no armazenamento, priorizando `.lua`
    arquivos=($(find /storage/emulated/0 -type f -iname "*.lua" -o -iname "*.txt" 2>/dev/null | sort))

    if [ ${#arquivos[@]} -eq 0 ]; then
        echo -e "\033[1;31mNenhum script encontrado!\033[0m"
        sleep 2
        menu
    fi

    # Exibir a lista formatada corretamente
    echo -e "$linha"
    echo -e "\033[1;32mScripts disponíveis:\033[0m"
    local count=1
    for file in "${arquivos[@]}"; do
        nome_arquivo=$(basename "$file")
        echo -e "\033[1;33m$count.\033[0m $nome_arquivo"
        ((count++))
    done
    echo -e "$linha"
    echo -n -e "\033[1;34mEscolha um número ou 0 para voltar: \033[0m"
    read escolha

    if [ "$escolha" == "0" ]; then
        menu
    elif [[ $escolha -gt 0 && $escolha -le ${#arquivos[@]} ]]; then
        caminho="${arquivos[$((escolha-1))]}"
        adicionar_autoexec "$caminho"
    else
        echo -e "\033[1;31mOpção inválida!\033[0m"
        sleep 1
        buscar_scripts
    fi
}

# ➕ Função para adicionar script ao AutoExec
adicionar_autoexec() {
    local caminho="$1"
    nome_script=$(basename "$caminho" | tr ' ' '-')
    destino="/storage/emulated/0/Arceus-X/AutoExec/$nome_script"

    mv "$caminho" "$destino"
    echo -e "\033[1;32m✅ Script '$nome_script' adicionado ao AutoExec!\033[0m"
    sleep 2
    menu
}

# ❌ Função para remover AutoExec Script
remover_autoexec() {
    clear
    echo -e "\033[1;36m📂 Scripts AutoExec encontrados:\033[0m"
    ls /storage/emulated/0/Arceus-X/AutoExec/
    echo -n -e "\033[1;34mDigite o nome do script a remover: \033[0m"
    read script
    rm "/storage/emulated/0/Arceus-X/AutoExec/$script"
    echo -e "\033[1;32m✅ Script removido com sucesso!\033[0m"
    sleep 2
    menu
}

# 🧹 Função para limpar logs do Workspace
limpar_logs() {
    clear
    echo -e "\033[1;36m🗑️ Limpando logs do Workspace...\033[0m"
    rm -rf /storage/emulated/0/Arceus-X/Workspace/*
    echo -e "\033[1;32m✅ Logs apagados!\033[0m"
    sleep 2
    menu
}

# 🚫 Função para remover abas do Arceus X
remover_abas() {
    clear
    echo -e "\033[1;36m🗑️ Removendo abas do Arceus X...\033[0m"
    rm -f /storage/emulated/0/Arceus-X/Configs/tabs.ax
    echo -e "\033[1;32m✅ Abas removidas!\033[0m"
    sleep 2
    menu
}

# 🏆 Função para minimizar Arceus X (limpar cache)
minimizar_arceus() {
    clear
    echo -e "\033[1;36m⚡ Limpando cache do Arceus X...\033[0m"
    rm -rf /storage/emulated/0/Android/data/com.arceusx/cache/*
    rm -rf /storage/emulated/0/Android/data/com.arceusx/files/*
    echo -e "\033[1;32m✅ Arceus X minimizado!\033[0m"
    sleep 2
    menu
}

# 📌 Criar requirements.txt para GitHub
criar_requirements() {
    echo "requests" > requirements.txt
    echo "termux-api" >> requirements.txt
    echo "✅ GitHub requirements.txt criado!"
}

# 🛠️ Criar requirements.txt automaticamente
criar_requirements

# 🚀 Executar o menu
menu
