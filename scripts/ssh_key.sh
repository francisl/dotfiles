#!/usr/bin/env zsh

echo -n "Do you want to configure your ssh key? (y/n): " 
read create_ssh_key

# Check the user's response
if [[ "$create_ssh_key" == "y" || "$create_ssh_key" == "Y" ]]; then
  echo -n "Email for the ssh key? : " 
  read email_address
  ssh-keygen -t ed25519 -C "$email_address"
  eval "$(ssh-agent -s)"
  echo "Host github.com\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
  pbcopy < ~/.ssh/id_ed25519.pub

  echo "Add the following to your github configuration (should be copied):"
  echo
  echo "go to https://github.com/settings/keys"
  echo "https://docs.github.com/fr/authentication/managing-commit-signature-verification/generating-a-new-gpg-key"
  echo
  echo "Add a new SSH key"
  cat ~/.ssh/id_ed25519.pub
  echo
else
    echo "Not Install: ssh key"
fi
