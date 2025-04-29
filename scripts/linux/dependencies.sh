#!/bin/bash

# Function to install software on Ubuntu
install_software_ubuntu() {
    sudo apt-get -y install setuptools
    sudo apt-get -y install cmake
    sudo apt-get -y install zsh
    sudo apt-get -y install neovim
}

# Function to install software on Manjaro
install_software_manjaro() {
    pamac install --no-confirm neovim
    pamac install --no-confirm ripgrep
}

# Function to install software on Fedora
install_software_fedora() {
    echo "Detected Fedora. Installing software using dnf..."
    sudo dnf install -y cmake zsh neovim go zig tmux \
        bat btop fd-find fzf git jq ripgrep htop \
        lazygit luarocks lua lsd ncdu ranger starship \
        tree-sitter rust cargo tectonic typescript-language-server \
        rust-nu wget xh
    # Install Chrome

    sudo dnf install fedora-workstation-repositories
    sudo dnf config-manager setopt google-chrome.enabled=1
    sudo dnf install google-chrome-stable
    sudo dnf group install sway-desktop-environment

}

# Generic configuration for all distributions
function install_software_generic() {
    # Add any generic software installation commands here
    echo "Installing generic software..."

    #
    # make zsh default shell
    chsh -s /bin/zsh
}

# Main function to detect the distribution and install software
install_software_linux() {
    distro_id=`cat /etc/os-release | grep "^ID="`
    readarray -d = -t distro <<< $distro_id

    if [ "$distro" = "ubuntu" ]; then
        install_software_ubuntu
    elif [ "$distro" = "manjaro" ]; then
        install_software_manjaro
    elif [ "$distro" = "fedora" ]; then
        install_software_fedora
    else
        echo "Unsupported Linux distribution: $distro"
    fi
}

# Call the main function
install_software_linux

