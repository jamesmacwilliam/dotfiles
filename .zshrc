# Shared zsh config for macOS + Linux.
# Machine-specific PATHs/env go in ~/.zshrc.local, secrets in ~/.zsh_credentials
# (neither is tracked).

# homebrew (apple silicon, intel mac, linuxbrew)
for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
  if [ -x "$brew_bin" ]; then
    eval "$("$brew_bin" shellenv)"
    break
  fi
done
unset brew_bin

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export EDITOR=nvim

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

[ -f ~/.zsh_credentials ] && source ~/.zsh_credentials
[ -f ~/.zsh_alias ] && source ~/.zsh_alias

# vi mode
bindkey -v

# nvm - switch node version on cd when a .nvmrc is present
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

  autoload -U add-zsh-hook

  load-nvmrc() {
    local nvmrc_path
    nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version
      nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
        nvm use
      fi
    elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }

  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi

# fzf (ctrl-t, ctrl-r, completion)
command -v fzf >/dev/null && source <(fzf --zsh)

# rbenv / pyenv
export PYENV_ROOT="$HOME/.pyenv"
[ -d "$PYENV_ROOT/bin" ] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v rbenv >/dev/null && eval "$(rbenv init - zsh)"
command -v pyenv >/dev/null && eval "$(pyenv init - zsh)"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
