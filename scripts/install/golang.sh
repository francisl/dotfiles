#!/usr/bin/env zsh

echo -n "Do you want to install go? (y/n): " 
read install_go

# Check the architecture
ARCH=$(uname -m)

# Check the user's response
if [[ "$install_go" == "y" || "$install_go" == "Y" ]]; then
    echo "Installing golang"
    cd ~/Downloads
    if [ "$ARCH" = "arm64" ]; then
        wget https://go.dev/dl/go1.23.1.darwin-arm64.tar.gz
        sudo tar -C /usr/local -xzf go1.23.1.darwin-arm64.tar.gz
    else
        wget https://go.dev/dl/go1.23.1.darwin-amd64.tar.gz
        sudo tar -C /usr/local -xzf go1.23.1.darwin-amd64.tar.gz
    fi
    
    if ! grep -qF 'export PATH=$PATH:/usr/local/go/bin' ~/.zshrc; then
      echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
    fi

    source ~/.zshrc
else
    echo "Not Install: go"
fi
