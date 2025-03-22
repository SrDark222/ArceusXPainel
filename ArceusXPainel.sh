#!/bin/bash

# Função para exibir o menu
menu() {
    clear
    echo "=============================="
    echo "       PAINEL ARCEUS X        "
    echo "=============================="
    echo " 1 - Adicionar AutoExec Script"
    echo " 2 - Remover AutoExec Script"
    echo " 3 - Limpar logs do Workspace"
    echo " 4 - Remover Abas do Arceus X"
    echo " 5 - Minimizar Arceus X"
    echo " 0 - Sair"
    echo "=============================="
    echo -n " Escolha uma opção: "
    read opcao

    case $opcao in
        1) adicionar_autoexec ;;
        2) remover_autoexec ;;
        3) limpar_logs ;;
        4) remover_abas ;;
        5) minimizar_arceus ;;
        0) exit ;;
        *) echo "Opção inválida!" && sleep 1 && menu ;;
    esac
}

# Função para buscar arquivos Lua contendo "loadstring"
buscar_scripts() {
    find /storage/emulated/0 -type f -name "*.lua" -exec grep -l "loadstring" {} +
}

# Adicionar AutoExec Script
adicionar_autoexec() {
    clear
    echo "Procurando scripts Lua fora da pasta Arceus X..."
    sleep 1
    buscar_scripts
    echo "Digite o caminho completo do script para adicionar ao AutoExec:"
    read caminho
    cp "$caminho" "/storage/emulated/0/Arceus X/AutoExec/"
    echo "Script adicionado com sucesso!"
    sleep 2
    menu
}

# Remover AutoExec Script
remover_autoexec() {
    clear
    echo "Scripts AutoExec encontrados:"
    ls /storage/emulated/0/Arceus\ X/AutoExec/
    echo "Digite o nome do script a remover:"
    read script
    rm "/storage/emulated/0/Arceus X/AutoExec/$script"
    echo "Script removido com sucesso!"
    sleep 2
    menu
}

# Limpar logs do Workspace
limpar_logs() {
    clear
    echo "Limpando logs do Workspace..."
    rm -rf /storage/emulated/0/Arceus\ X/Workspace/*
    echo "Logs apagados com sucesso!"
    sleep 2
    menu
}

# Remover Abas do Arceus X
remover_abas() {
    clear
    echo "Removendo abas do Arceus X..."
    rm -f /storage/emulated/0/Arceus\ X/Configs/tabs.ax
    echo "Abas removidas!"
    sleep 2
    menu
}

# Minimizar Arceus X (limpar cache e apagar data/cache)
minimizar_arceus() {
    clear
    echo "Limpando cache do Arceus X..."
    rm -rf /storage/emulated/0/Android/data/com.arceusx/cache/*
    rm -rf /storage/emulated/0/Android/data/com.arceusx/files/*
    echo "Arceus X minimizado!"
    sleep 2
    menu
}

# Executar o menu
menu
