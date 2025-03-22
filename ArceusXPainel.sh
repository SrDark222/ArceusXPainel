#!/bin/bash

# Solicita acesso ao armazenamento
termux-setup-storage

# Caminhos das pastas do Arceus X
BASE_DIR="/storage/emulated/0/Arceus X"
WORKSPACE="$BASE_DIR/Workspace"
SCRIPT_HUB="$BASE_DIR/Script Hub"
CONFIGS="$BASE_DIR/Configs"
AUTOEXEC="$BASE_DIR/AutoExec"

# Criar pastas necessárias caso não existam
mkdir -p "$WORKSPACE" "$SCRIPT_HUB" "$CONFIGS" "$AUTOEXEC"

# Função para mostrar menu com estilo hacker
menu() {
    clear
    echo -e "\033[1;32m==============================================\033[0m"
    echo -e "\033[1;33mᗩ ﹒💻 𝑯𝑬𝒀 𝑩𝑳𝑶𝑿𝒀𝒔 - 𝑻𝒐𝒅𝒐 𝒃𝒆𝒎 𝒄𝒐𝒎 𝓬𝓲𝓮𝓷𝓬𝓲𝓪?\033[0m"
    echo -e "\033[1;31m⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒\033[0m"
    echo -e "\033[1;32m==============================================\033[0m"
    echo -e "\033[1;33m📂 : 𝐑𝐞𝐝𝐢𝐫𝐞𝐜𝐢𝐨𝐧𝐚𝐧𝐝𝐨 𝐏𝐚𝐬𝐭𝐚𝐬 𝐧𝐨 𝐒𝐲𝐬𝐭𝐞𝐦 \033[0m"
    echo -e "\033[1;31m⊹˚.⋆ ₊ 𝒸𝒶𝑑𝒶 𝒑𝒂𝓼𝓽𝒂 𝓼𝒐𝒃𝒓𝒆𝓿𝓲𝓿𝒆𝓶 \033[0m"
    echo -e "\033[1;32m☆ : ୨🟩📁 𝑺𝑬𝑮𝑼𝑹𝑨𝑨 𝑷𝑨𝑻𝑨𝑺 𝑳𝑬𝑰𝑻𝑰𝑽𝑨𝑺 \033[0m"
    echo -e "\033[1;31m⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒\033[0m"
    echo -e "\033[1;32m☆ : ୨🟩 𝑩𝑹𝑨𝑲𝑬 𝑩𝑨𝑲𝑨𝑩𝑶𝑿𝑬𝑺\033[0m"
    echo -e "\033[1;31m⊹˚.⋆ ₊ 𝑩𝑹𝑨𝑲𝑬𝑻𝑶𝑵𝑹𝑨𝑵𝑩𝑨 𝑺𝑬𝑪𝑼𝑹𝑰𝑻𝒀\033[0m"
    echo -e "\033[1;33m☆ : ୨🟥 𝑺𝑬𝑹𝑽𝑰𝑪𝑰𝑶𝑺: 𝑴𝑰𝑺𝑻𝑬𝑹 𝑻𝒓𝒊𝒆𝒍 𝑨𝒖𝒕𝒐𝒆𝒙𝒆𝒕𝒖𝑻𝑷"
    echo -e "\033[1;31m⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒\033[0m"
    echo -e "\033[1;32m***************************************\033[0m"
    echo -e "\033[1;33m📂 𝑬𝒙𝒆𝒄𝒖𝒕𝒆 𝒂𝒍𝒈𝒖𝒎 𝑬𝒇𝒆𝒄𝒕𝒊𝒗𝑶\033[0m"
    echo -e "\033[1;32m-----------------------------------------------\033[0m"
    echo -e "\033[1;31m1 - Listar Arquivos de Sistema\033[0m"
    echo -e "\033[1;33m2 - Remover Arquivos de AutoExec\033[0m"
    echo -e "\033[1;32m3 - Limpar Pastas de Workspace\033[0m"
    echo -e "\033[1;31m4 - Apagar Abas Do Arceus X\033[0m"
    echo -e "\033[1;32m0 - Fechar e Sair\033[0m"
    echo -e "\033[1;32m***************************************\033[0m"
    echo -ne "Escolha uma opção: "
    read opcao
    case $opcao in
        1) listar_arquivos ;;
        2) remover_autoexec ;;
        3) limpar_workspace ;;
        4) remover_abas ;;
        0) exit ;;
        *) echo "Opção inválida!" ;;
    esac
}

# Função para listar arquivos
listar_arquivos() {
    clear
    echo -e "\033[1;32m==============================================\033[0m"
    echo -e "\033[1;33m Arquivos Disponíveis no Sistema: \033[0m"
    echo -e "\033[1;31m==============================================\033[0m"
    echo -e "\033[1;33m* AutoExec/ \033[1;32m- Scripts para execução automática\033[0m"
    echo -e "\033[1;33m* Workspace/ \033[1;32m- Área de trabalho para códigos temporários\033[0m"
    echo -e "\033[1;33m* Script Hub/ \033[1;32m- Repositório de scripts diversos\033[0m"
    echo -e "\033[1;33m* Configs/ \033[1;32m- Arquivos de configuração do sistema\033[0m"
    echo -e "\033[1;32m==============================================\033[0m"
    echo -e "\033[1;31mPressione ENTER para voltar...\033[0m"
    read
    menu
}

# Função para remover arquivos do AutoExec
remover_autoexec() {
    clear
    echo -e "\033[1;33m==============================================\033[0m"
    echo -e "\033[1;32m Removendo arquivos do AutoExec...\033[0m"
    rm -rf "$AUTOEXEC/*"
    echo -e "\033[1;31m==============================================\033[0m"
    echo -e "\033[1;32mArquivos removidos com sucesso!\033[0m"
    echo -e "\033[1;31mPressione ENTER para voltar...\033[0m"
    read
    menu
}

# Função para limpar workspace
limpar_workspace() {
    clear
    echo -e "\033[1;33m==============================================\033[0m"
    echo -e "\033[1;32m Limpando workspace...\033[0m"
    rm -rf "$WORKSPACE/*"
    echo -e "\033[1;31m==============================================\033[0m"
    echo -e "\033[1;32mWorkspace limpo com sucesso!\033[0m"
    echo -e "\033[1;31mPressione ENTER para voltar...\033[0m"
    read
    menu
}

# Função para remover abas
remover_abas() {
    clear
    echo -e "\033[1;33m==============================================\033[0m"
    echo -e "\033[1;32m Removendo abas no Arceus X...\033[0m"
    # Comando fictício para remover abas, substitua com o que for necessário
    echo -e "\033[1;31m==============================================\033[0m"
    echo -e "\033[1;32mAbas removidas com sucesso!\033[0m"
    echo -e "\033[1;31mPressione ENTER para voltar...\033[0m"
    read
    menu
}

# Iniciar menu
menu
