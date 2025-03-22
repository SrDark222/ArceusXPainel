#!/bin/bash

# Exibir ASCII Art
echo -e "\033[1;32m
--[[
___  ___                       ______ _    
|  \/  |                       |  _  \ |   
| .  . | ___ _ __   ___  _ __  | | | | | __
| |\/| |/ _ \ '_ \ / _ \| '__| | | | | |/ /
| |  | |  __/ | | | (_) | |    | |/ /|   < 
\_|  |_/\___|_| |_|\___/|_|    |___/ |_|\_\
  By ~ Dkzin 🇪🇬 / TCC DOMINA 
]]--
\033[0m"

# Função para exibir o menu com decoração melhorada
menu() {
    clear
    echo -e "\033[1;35m================================================\033[0m"
    echo -e "\033[1;32m          PAINEL ARCEUS X \033[1;33m[Melhorado] \033[0m"
    echo -e "\033[1;35m================================================\033[0m"
    echo -e "\033[1;36m 1 - \033[1;33mAdicionar AutoExec Script \033[0m"
    echo -e "\033[1;36m 2 - \033[1;33mRemover AutoExec Script \033[0m"
    echo -e "\033[1;36m 3 - \033[1;33mLimpar logs do Workspace \033[0m"
    echo -e "\033[1;36m 4 - \033[1;33mRemover Abas do Arceus X \033[0m"
    echo -e "\033[1;36m 5 - \033[1;33mMinimizar Arceus X \033[0m"
    echo -e "\033[1;36m 0 - \033[1;31mSair \033[0m"
    echo -e "\033[1;35m================================================\033[0m"
    echo -n " \033[1;34mEscolha uma opção: \033[0m"
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

# Função para buscar arquivos Lua contendo "loadstring" ignorando maiúsculas/minúsculas
buscar_scripts() {
    find /storage/emulated/0 -type f -iname "*.lua" -exec grep -il "loadstring" {} + 2>/dev/null
}

# Adicionar AutoExec Script
adicionar_autoexec() {
    clear
    echo -e "\033[1;36mProcurando scripts Lua fora da pasta Arceus X...\033[0m"
    sleep 1
    buscar_scripts
    echo -e "\033[1;34mDigite o caminho completo do script para adicionar ao AutoExec:\033[0m"
    read caminho
    cp "$caminho" "/storage/emulated/0/Arceus X/AutoExec/"
    echo -e "\033[1;32mScript adicionado com sucesso!\033[0m"
    sleep 2
    menu
}

# Remover AutoExec Script
remover_autoexec() {
    clear
    echo -e "\033[1;36mScripts AutoExec encontrados:\033[0m"
    ls /storage/emulated/0/Arceus\ X/AutoExec/
    echo -e "\033[1;34mDigite o nome do script a remover:\033[0m"
    read script
    rm "/storage/emulated/0/Arceus X/AutoExec/$script"
    echo -e "\033[1;32mScript removido com sucesso!\033[0m"
    sleep 2
    menu
}

# Limpar logs do Workspace
limpar_logs() {
    clear
    echo -e "\033[1;36mLimpando logs do Workspace...\033[0m"
    rm -rf /storage/emulated/0/Arceus\ X/Workspace/*
    echo -e "\033[1;32mLogs apagados com sucesso!\033[0m"
    sleep 2
    menu
}

# Remover Abas do Arceus X
remover_abas() {
    clear
    echo -e "\033[1;36mRemovendo abas do Arceus X...\033[0m"
    rm -f /storage/emulated/0/Arceus\ X/Configs/tabs.ax
    echo -e "\033[1;32mAbas removidas!\033[0m"
    sleep 2
    menu
}

# Minimizar Arceus X (limpar cache e apagar data/cache)
minimizar_arceus() {
    clear
    echo -e "\033[1;36mLimpando cache do Arceus X...\033[0m"
    rm -rf /storage/emulated/0/Android/data/com.arceusx/cache/*
    rm -rf /storage/emulated/0/Android/data/com.arceusx/files/*
    echo -e "\033[1;32mArceus X minimizado!\033[0m"
    sleep 2
    menu
}

# Executar o menu
menu
