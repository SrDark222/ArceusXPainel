#!/bin/bash

# Caminhos das pastas para manipulação de arquivos
BASE_DIR="/storage/emulated/0/Arceus X"
WORKSPACE="$BASE_DIR/Workspace"
SCRIPT_HUB="$BASE_DIR/Script Hub"
CONFIGS="$BASE_DIR/Configs"
AUTOEXEC="$BASE_DIR/AutoExec"

# Criar as pastas, se não existirem
mkdir -p "$WORKSPACE" "$SCRIPT_HUB" "$CONFIGS" "$AUTOEXEC"

# Função para mostrar o menu principal
show_menu() {
    clear
    echo -e "\033[1;32m==============================================\033[0m"
    echo -e "\033[1;33m💻 Bem-vindo ao Menu de Manipulação de Arquivos ArceusX\033[0m"
    echo -e "\033[1;32m==============================================\033[0m"
    echo -e "1 - Adicionar Script à Execução Automática"
    echo -e "2 - Mover Arquivos entre Pastas"
    echo -e "3 - Limpar Pastas"
    echo -e "4 - Sair"
    echo -e "\033[1;32m==============================================\033[0m"
    echo -n "Escolha uma opção: "
    read choice
    case $choice in
        1) add_autoexec_script ;;
        2) move_files ;;
        3) clear_folders ;;
        4) exit ;;
        *) echo "Opção inválida!" && show_menu ;;
    esac
}

# Função para adicionar script à execução automática
add_autoexec_script() {
    clear
    echo -e "\033[1;33m==============================================\033[0m"
    echo -e "\033[1;32mEscolha o script que deseja adicionar à execução automática: \033[0m"
    echo -e "\033[1;33m==============================================\033[0m"
    
    # Mostrar arquivos disponíveis na pasta de scripts
    files=($(find $SCRIPT_HUB -type f -name "*.lua" -or -name "*.txt"))
    
    # Exibir scripts encontrados
    if [ ${#files[@]} -eq 0 ]; then
        echo -e "Nenhum arquivo de script encontrado."
    else
        for i in "${!files[@]}"; do
            echo "$((i+1)) - ${files[$i]}"
        done
    fi

    # Solicitar ao usuário para escolher o script
    echo -n "Digite o número do script para adicionar à execução automática: "
    read choice
    script_to_add="${files[$((choice-1))]}"

    # Verificar se o script foi selecionado corretamente
    if [ -f "$script_to_add" ]; then
        # Mover o script para a pasta de AutoExec
        cp "$script_to_add" "$AUTOEXEC"
        echo -e "\033[1;32mScript '$script_to_add' adicionado à execução automática com sucesso!\033[0m"
    else
        echo -e "\033[1;31mErro: Script não encontrado ou escolha inválida.\033[0m"
    fi
    read -n 1 -s -r -p "Pressione qualquer tecla para voltar ao menu."
    show_menu
}

# Função para mover arquivos entre pastas
move_files() {
    clear
    echo -e "\033[1;33m==============================================\033[0m"
    echo -e "\033[1;32mEscolha o arquivo para mover: \033[0m"
    echo -e "\033[1;33m==============================================\033[0m"
    
    # Mostrar arquivos disponíveis na pasta de scripts
    files=($(find $SCRIPT_HUB -type f))
    
    # Exibir arquivos encontrados
    if [ ${#files[@]} -eq 0 ]; then
        echo -e "Nenhum arquivo de script encontrado."
    else
        for i in "${!files[@]}"; do
            echo "$((i+1)) - ${files[$i]}"
        done
    fi

    # Solicitar ao usuário para escolher o arquivo
    echo -n "Digite o número do arquivo para mover: "
    read choice
    file_to_move="${files[$((choice-1))]}"

    # Solicitar ao usuário o destino
    echo -e "\033[1;33mEscolha a pasta de destino: \033[0m"
    echo "1 - Workspace"
    echo "2 - Script Hub"
    echo "3 - Configs"
    echo "4 - AutoExec"
    echo -n "Digite o número do destino: "
    read dest_choice

    # Determinar o destino
    case $dest_choice in
        1) dest="$WORKSPACE" ;;
        2) dest="$SCRIPT_HUB" ;;
        3) dest="$CONFIGS" ;;
        4) dest="$AUTOEXEC" ;;
        *) echo -e "\033[1;31mDestino inválido.\033[0m" && show_menu ;;
    esac

    # Mover o arquivo
    if [ -f "$file_to_move" ]; then
        mv "$file_to_move" "$dest"
        echo -e "\033[1;32mArquivo '$file_to_move' movido para $dest com sucesso!\033[0m"
    else
        echo -e "\033[1;31mErro: Arquivo não encontrado ou escolha inválida.\033[0m"
    fi
    read -n 1 -s -r -p "Pressione qualquer tecla para voltar ao menu."
    show_menu
}

# Função para limpar pastas
clear_folders() {
    clear
    echo -e "\033[1;33m==============================================\033[0m"
    echo -e "\033[1;32mEscolha a pasta para limpar: \033[0m"
    echo -e "\033[1;33m==============================================\033[0m"
    echo "1 - Workspace"
    echo "2 - Script Hub"
    echo "3 - Configs"
    echo "4 - AutoExec"
    echo -n "Digite o número da pasta para limpar: "
    read folder_choice

    # Determinar a pasta para limpar
    case $folder_choice in
        1) folder_to_clear="$WORKSPACE" ;;
        2) folder_to_clear="$SCRIPT_HUB" ;;
        3) folder_to_clear="$CONFIGS" ;;
        4) folder_to_clear="$AUTOEXEC" ;;
        *) echo -e "\033[1;31mEscolha inválida.\033[0m" && show_menu ;;
    esac

    # Limpar a pasta
    rm -rf "$folder_to_clear"/*
    echo -e "\033[1;32mPasta '$folder_to_clear' limpa com sucesso!\033[0m"
    read -n 1 -s -r -p "Pressione qualquer tecla para voltar ao menu."
    show_menu
}

# Chama o menu principal
show_menu
