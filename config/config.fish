if status is-interactive
  # Commands to run in interactive sessions can go here
  ### for homebrew(mac)
  if test -d /opt/homebrew/bin
    eval (/opt/homebrew/bin/brew shellenv)
  end

  ###
  if test -d ~/.config/fish/mytheme_colors.fish
    source ~/.config/fish/mytheme_colors.fish
  end

  ### for exa(rich ls command)
  alias rls='ls'
  alias ls='exa --icons --git'
  alias la='exa -a --icons --git'
  alias lt='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias ltl='exa -T -L 3 -a -I "node_modules|.git|.cache" -l --icons'

  ### for bat
  alias cat='bat'
  alias rcat='cat'

  ### for direnv
  eval (direnv hook fish)
  
  ### for peco
  function fish_user_key_bindings
    bind \cr peco_select_history #Ctrl+r でコマンド履歴
    bind \c] peco_select_ghq_repository #Ctrl+] でrepositoryのlist
    bind \ck peco_kill #Ctrl+k でprocessのkill
  end
  
  ### for golang
  set -x GOPATH ~/workspace
  set -x GOENV_DISABLE_GOPATH 1
  fish_add_path ~/workspace/bin
  
  
  ### for npm modules
  fish_add_path ~/.npm_modules/bin
  
  ### command alias
  alias dc='docker compose'
  
  ### for gh
  eval "$(gh completion -s fish)"
  
  
  ### for asdf
  source /opt/homebrew/opt/asdf/libexec/asdf.fish
  
  
  ### for tmux
  function attach_tmux_session_if_needed
    set ID (tmux list-sessions)
    if test -z "$ID"
      tmux new-session
      return
    end
  
    set new_session "Create New Session" 
    set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
    if test "$ID" = "$new_session"
      tmux new-session
    else if test -n "$ID"
      tmux attach-session -t "$ID"
    end
  end
  
  if test -z $TMUX && status --is-login
    attach_tmux_session_if_needed
  end
  
  ### for starship(prompt custom)
  starship init fish | source
end
