#!/bin/bash

# Function to install software on Ubuntu
install_software_ubuntu() {
    sudo apt-get -y install setuptools
    sudo apt-get -y install cmake
    sudo apt-get -y install zsh
    sudo apt-get -y install neovim
    sudo apt-get -y install helix
}

# Function to install software on Manjaro
install_software_manjaro() {
    pamac install --no-confirm neovim
    pamac install --no-confirm ripgrep
}

# Function to install software on Fedora
install_software_fedora() {
    echo "Detected Fedora. Installing software using dnf..."
    sudo dnf install -y zsh neovim go zig tmux \
        gcc gcc-c++ make cmake clang clang-devel \
        bat btop fd-find fzf git jq ripgrep htop \
        luarocks lua lsd ncdu ranger \
        tree-sitter rust cargo typescript-language-server \
        rust-nu wget xh ghostty helix
     # Install Chrome

    sudo dnf install fedora-workstation-repositories
    sudo dnf config-manager setopt google-chrome.enabled=1
    sudo dnf install google-chrome-stable
    sudo dnf install iosevka-nerd-fonts
    # sudo dnf group install sway-desktop-environment
    sudo dnf copr enable solopasha/hyprland
    sudo dnf install hyprland hyprpaper hyprpicker hypridle hyprshot waybar hyprlock hyprsunset waypaper

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
    distro=`cat /etc/os-release | grep "^ID=" | cut -d= -f2`

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

