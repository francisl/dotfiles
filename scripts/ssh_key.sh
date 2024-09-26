#!/usr/bin/env zsh

echo -n "Do you want to configure your ssh key? (y/n): " 
read create_ssh_key

# Check the user's response
if [[ "$create_ssh_key" == "y" || "$create_ssh_key" == "Y" ]]; then
  echo -n "Email for the ssh key? : " 
  read email_address
  ssh-keygen -t ed25519 -C "$email_address"
  eval "$(ssh-agent -s)"
  echo -e "\nHost github.com\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
else
    echo "Not Install: ssh key"
fi
