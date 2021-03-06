# ~/.zshrc
# with content borrowed from prezto: https://github.com/sorin-ionescu/prezto
# with content borrowed from oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh

zsh_modules_dir="${ZDOTDIR:-$HOME}/modules"
if [[ -e "$zsh_modules_dir/init.zsh" ]]; then
  source "$zsh_modules_dir/init.zsh"
fi
