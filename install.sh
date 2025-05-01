#!/bin/bash

TMUX_PLUGIN_MANAGER_REPO="https://github.com/tmux-plugins/tpm"
TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/tpm"
FISH_SHELL_PATH="/usr/bin/fish"

PACKAGES_TO_INSTALL=(
    less
    stow
    unzip
    ripgrep
    openssh
    tmux
    fish
)

command_exists () {
    command -v "$1" >/dev/null 2>&1
}

install_package () {
    local package="$1"
    echo "Tentando instalar $package..."
    if command_exists pacman; then
        sudo pacman -S --needed --noconfirm "$package"
    elif command_exists apt; then
        sudo apt update && sudo apt install -y "$package"
    else
        echo "Gerenciador de pacotes não reconhecido. Instale $package manualmente."
        return 1
    fi
    return 0
}

install_build_tools () {
    echo "Tentando instalar ferramentas de build..."
    if command_exists pacman; then
        install_package base-devel
    elif command_exists apt; then
        install_package build-essential
    else
        echo "Ferramentas de build não encontradas. Instale-as manualmente."
        return 1
    fi
    return 0
}

install_build_tools

echo "Instalando pacotes..."
for package in "${PACKAGES_TO_INSTALL[@]}"; do
    if [[ "$package" != "fish" ]]; then
        install_package "$package"
    fi
done

if ! command_exists tmux; then
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
        read -p "Definir fish como shell padrão para o usuário ($USER)? (s/N): " answer
        if [[ "$answer" =~ ^[Ss]$ ]]; then
            chsh -s "$FISH_SHELL_PATH"
            echo "Reinicie seu terminal para aplicar a mudança de shell."
        fi
    fi
fi

echo "Aplicando configurações com stow..."
if command_exists stow; then
    stow .
else
    echo "stow não encontrado. A instalação falhou, execute 'stow .' manualmente."
fi

echo "Configuração concluída."
