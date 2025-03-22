#!/bin/bash

# Função para exibir o título fixo ASCII
titulo() {
    clear
    echo -e "\033[1;32m=====================================\033[0m"
    echo -e "\033[1;33m       MenorDk - Feito por Menor DK 🇪🇬\033[0m"
    echo -e "\033[1;32m=====================================\033[0m"
}

# Função para exibir o menu
menu() {
    titulo
    echo -e "\033[1;36m==============================\033[0m"
    echo -e "\033[1;35m       PAINEL ARCEUS X        \033[0m"
    echo -e "\033[1;36m==============================\033[0m"
    echo -e "\033[1;32m 1 - Adicionar AutoExec Script \033[0m"
    echo -e "\033[1;32m 2 - Remover AutoExec Script \033[0m"
    echo -e "\033[1;32m 3 - Limpar logs do Workspace \033[0m"
    echo -e "\033[1;32m 4 - Remover Abas do Arceus X \033[0m"
    echo -e "\033[1;32m 5 - Minimizar Arceus X \033[0m"
    echo -e "\033[1;31m 0 - Sair \033[0m"
    echo -e "\033[1;36m==============================\033[0m"
    echo -n "Escolha uma opção: "
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

# Função para buscar scripts Lua contendo "loadstring"
buscar_scripts() {
    find /storage/emulated/0 -type f -name "*.lua" -exec grep -l "loadstring" {} + | grep -v "0b"
}

# Adicionar AutoExec Script
adicionar_autoexec() {
    titulo
    echo -e "\033[1;33mProcurando scripts Lua fora da pasta Arceus X...\033[0m"
    sleep 1
    buscar_scripts
    echo -e "\033[1;32mDigite o caminho completo do script para adicionar ao AutoExec:\033[0m"
    read caminho

    # Verificar se o arquivo existe
    if [ -f "$caminho" ]; then
        cp "$caminho" "/storage/emulated/0/Arceus-X/AutoExec/"
        echo -e "\033[1;32mScript adicionado com sucesso!\033[0m"
    else
        echo -e "\033[1;31mErro: O script não foi encontrado no caminho especificado!\033[0m"
    fi
    sleep 2
    menu
}

# Remover AutoExec Script
remover_autoexec() {
    titulo
    echo -e "\033[1;33mScripts AutoExec encontrados:\033[0m"

    # Verificar se a pasta AutoExec existe
    if [ -d "/storage/emulated/0/Arceus-X/AutoExec" ]; then
        ls /storage/emulated/0/Arceus-X/AutoExec/
        echo -e "\033[1;32mDigite o nome do script a remover:\033[0m"
        read script

        # Verificar se o script existe
        if [ -f "/storage/emulated/0/Arceus-X/AutoExec/$script" ]; then
            rm "/storage/emulated/0/Arceus-X/AutoExec/$script"
            echo -e "\033[1;32mScript removido com sucesso!\033[0m"
        else
            echo -e "\033[1;31mErro: O script não foi encontrado!\033[0m"
        fi
    else
        echo -e "\033[1;31mErro: A pasta AutoExec não existe!\033[0m"
    fi
    sleep 2
    menu
}

# Limpar logs do Workspace
limpar_logs() {
    titulo
    echo -e "\033[1;33mLimpando logs do Workspace...\033[0m"

    # Verificar se a pasta Workspace existe
    if [ -d "/storage/emulated/0/Arceus-X/Workspace" ]; then
        rm -rf /storage/emulated/0/Arceus-X/Workspace/*
        echo -e "\033[1;32mLogs apagados com sucesso!\033[0m"
    else
        echo -e "\033[1;31mErro: A pasta Workspace não existe!\033[0m"
    fi
    sleep 2
    menu
}

# Remover Abas do Arceus X
remover_abas() {
    titulo
    echo -e "\033[1;33mRemovendo abas do Arceus X...\033[0m"

    # Verificar se a pasta Configs existe
    if [ -f "/storage/emulated/0/Arceus-X/Configs/tabs.ax" ]; then
        rm -f /storage/emulated/0/Arceus-X/Configs/tabs.ax
        echo -e "\033[1;32mAbas removidas!\033[0m"
    else
        echo -e "\033[1;31mErro: Não foi possível encontrar as abas do Arceus X!\033[0m"
    fi
    sleep 2
    menu
}

# Minimizar Arceus X (limpar cache e apagar data/cache)
minimizar_arceus() {
    titulo
    echo -e "\033[1;33mLimpando cache do Arceus X...\033[0m"

    # Verificar se o diretório de cache existe
    if [ -d "/storage/emulated/0/Android/data/com.arceusx/cache" ]; then
        rm -rf /storage/emulated/0/Android/data/com.arceusx/cache/*
        rm -rf /storage/emulated/0/Android/data/com.arceusx/files/*
        echo -e "\033[1;32mArceus X minimizado!\033[0m"
    else
        echo -e "\033[1;31mErro: O diretório de cache do Arceus X não existe!\033[0m"
    fi
    sleep 2
    menu
}

# Executar o menu
menu
