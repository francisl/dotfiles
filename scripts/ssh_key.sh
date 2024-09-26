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
  pbcopy < ~/.ssh/id_ed25519.pub

  echo -e "Add the following to your github configuration (should be copied) : \n"
  echo -e "go to https://github.com/settings/keys \n"
  cat ~/.ssh/id_ed25519.pub
  echo -e "\n"
else
    echo "Not Install: ssh key"
fi
