#!/bin/bash

set -e

TMUX_PLUGIN_MANAGER_REPO="https://github.com/tmux-plugins/tpm"
TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/tpm"
FISH_SHELL_PATH="/usr/bin/fish"
PACKAGES=(curl less stow unzip ripgrep tmux fish neovim)

command_exists() {
    command -v "$1" &>/dev/null
}

use_package_manager() {
    if command_exists pacman; then
        sudo pacman -S --needed --noconfirm "$@"
    elif command_exists apt; then
        sudo apt update
        sudo apt install -y "$@"
    else
        echo "Nenhum gerenciador de pacotes suportado encontrado."
        exit 1
    fi
}

install_dependencies() {
    echo "Instalando dependências básicas..."
    use_package_manager "${PACKAGES[@]}"
}

install_build_tools() {
    echo "Instalando ferramentas de build..."
    if command_exists pacman; then
        use_package_manager base-devel
    else
        use_package_manager build-essential
    fi
}

install_starship() {
    echo "Instalando Starship..."
    curl -sS https://starship.rs/install.sh | sh
}

clone_tpm() {
    echo "Verificando TPM..."
    if [ ! -d "$TMUX_PLUGIN_MANAGER_PATH" ]; then
        git clone --depth=1 "$TMUX_PLUGIN_MANAGER_REPO" "$TMUX_PLUGIN_MANAGER_PATH"
    else
        echo "TPM já está instalado."
    fi
}

set_fish_as_default_shell() {
    if [[ "$SHELL" != "$FISH_SHELL_PATH" ]]; then
        read -p "Deseja definir o fish como shell padrão? (s/N): " answer
        if [[ "$answer" =~ ^[Ss]$ ]]; then
            chsh -s "$FISH_SHELL_PATH"
            echo "Shell alterado. Reinicie o terminal para aplicar a mudança."
        fi
    fi
}

apply_dotfiles() {
    echo "Aplicando configurações com stow..."
    stow .
}

install_build_tools
install_dependencies
clone_tpm

if command_exists fish; then
    set_fish_as_default_shell
fi

if command_exists curl; then
    install_starship
fi

if command_exists stow; then
    apply_dotfiles
else
    echo "stow não encontrado. Execute 'stow .' manualmente."
fi

echo "Configuração concluída com sucesso."

