#!/usr/bin/env zsh

setopt EXTENDED_GLOB
for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${HOME}/.${rcfile:t}"
done
