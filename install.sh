#!/bin/bash

TMUX_PLUGIN_MANAGER_REPO="https://github.com/tmux-plugins/tpm"
TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/tpm"
FISH_SHELL_PATH="/usr/bin/fish"

command_exists () {
    command -v "$1" >/dev/null 2>&1
}

install_package () {
    echo "Tentando instalar $1..."
    if command_exists pacman; then
        sudo pacman -S --noconfirm "$1"
    elif command_exists apt; then
        sudo apt update && sudo apt install -y "$1"
    else
        echo "Gerenciador de pacotes não reconhecido. Instale $1 manualmente."
        return 1
    fi
    return 0
}

if ! command_exists tmux; then
    echo "tmux não encontrado."
    install_package tmux
fi

if [ ! -d "$TMUX_PLUGIN_MANAGER_PATH" ]; then
    echo "TPM não encontrado. Clonando..."
    git clone --depth=1 "$TMUX_PLUGIN_MANAGER_REPO" "$TMUX_PLUGIN_MANAGER_PATH"
fi

if ! command_exists fish; then
    echo "fish não encontrado."
    install_package fish
fi

if command_exists fish; then
    current_shell=$(ps -p $$ -o comm=)
    if [[ "$current_shell" != "fish" ]]; then
        read -p "Definir fish como seu shell padrão? (s/N): " answer
        if [[ "$answer" =~ ^[Ss]$ ]]; then
            sudo chsh -s "$FISH_SHELL_PATH"
            echo "Reinicie seu terminal para aplicar a mudança de shell."
        fi
    fi
fi

echo "Configuração inicial dos dotfiles concluída!"
