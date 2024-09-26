#!/usr/bin/env bash

platform=`uname`

if [[ "$platform" == 'Linux' ]]; then
elif [[ "$platform" == 'Darwin' ]]; then
    # Homebrew
    brewbin=`which brew`
    if [ ! $brewbin ]; then
        echo installing brew ..
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install git wget
fi

#!/bin/bash

# List of software to install
software_list=(
    "htop"
    "btop"
    "git"
    "jq"
    "neovim"
    "starship"
    "tree"
    "wget"
)

# Function to check if Homebrew is installed
check_homebrew() {
    
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo "Homebrew is already installed."
    fi
}

# Function to install software using Homebrew
install_software_homebrew() {
    for software in "${software_list[@]}"; do
        if brew list $software &> /dev/null || brew list --cask $software &> /dev/null; then
            echo "$software is already installed."
        else
            echo "Installing $software..."
            if brew install $software &> /dev/null || brew install --cask $software &> /dev/null; then
                echo "$software installed successfully."
            else
                echo "Failed to install $software."
            fi
        fi
    done
}

install_software_linux() {
    distro_id=`cat /etc/os-release | grep "^ID="`
    readarray -d = -t distro <<< $distro_id

    if [ "$distro" = "ubuntu" ]; then
    sudo apt-get -y install setuptools
    sudo apt-get -y install cmake
    sudo apt-get -y install zsh
    sudo apt-get -y install neovim
    fi

    if [ "$distro" = "manjaro" ]; then
    pamac install --no-confirm neovim
    pamac install --no-confirm ripgrep 

    fi
}

# Main script execution
echo "Starting software installation..."

if [[ "$platform" == 'Linux' ]]; then
    # Install software
    install_software_linux
elif [[ "$platform" == 'Darwin' ]]; then
    # Check for Homebrew
    check_homebrew

    # Install software
    install_software_homebrew
fi

echo "Software installation complete."


# Prompt the user for confirmation
read -p "Do you want to proceed with the local installation of the dotfiles project? (y/n): " install_dotfiles

# Check the user's response
if [[ "$install_dotfiles" == "y" || "$install_dotfiles" == "Y" ]]; then
    echo "Proceeding with the installation..."
    cd ~
    if [ ! -z ~/dotfiles ]; then
        git clone https://github.com/francisl/dotfiles.git
    fi

    cd ~/dotfiles
    git fetch --all
    git reset --hard origin/main
    ./scripts/configure.sh
else
    echo "Installation aborted by the user."
fi
