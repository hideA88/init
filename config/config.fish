if status is-interactive
  # Commands to run in interactive sessions can go here
  ### for homebrew(mac)
  if test -d /opt/homebrew/bin
    eval (/opt/homebrew/bin/brew shellenv)
  else
    ### for ubuntu
    fish_add_path ~/.cargo/bin
  end


  ###
  if test -d ~/.config/fish/mytheme_colors.fish
    source ~/.config/fish/mytheme_colors.fish
  end


  ### for direnv
  eval (direnv hook fish)

  ### for asdf
  # ASDF configuration code
  if test -z $ASDF_DATA_DIR
      set _asdf_shims "$HOME/.asdf/shims"
  else
      set _asdf_shims "$ASDF_DATA_DIR/shims"
  end
  
  # Do not use fish_add_path (added in Fish 3.2) because it
  # potentially changes the order of items in PATH
  if not contains $_asdf_shims $PATH
      set -gx --prepend PATH $_asdf_shims
  end
  set --erase _asdf_shims



  
  ### for keybinding
  function fish_user_key_bindings
    bind \c] __ghq_repository_search

    bind \cb  fzf-checkout-branch
    bind \cp _fzf_search_processes
    bind \cr _fzf_search_history
    bind \co _fzf_search_directory
    bind \cl _fzf_search_git_log
    bind \cg _fzf_search_git_status

    bind \cd fzf-docker-continer-name-select
  end
  
  ### for golang
  set -x GOPATH ~/workspace
  set -x GOENV_DISABLE_GOPATH 1
  fish_add_path ~/workspace/bin
  
  
  ### for npm modules
  fish_add_path ~/.npm_modules/bin
  
  ## command alias
  ### for docker
  alias dc='docker compose'
  ### for exa(rich ls command)
  ## alias rls='ls'
  ## alias ls='exa --icons --git'
  ## alias la='exa -a --icons --git'
  ## alias lt='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  ## alias ltl='exa -T -L 3 -a -I "node_modules|.git|.cache" -l --icons'

  ### for bat
  alias cat='bat'
  alias rcat='cat'
  
  ### for gh
  eval "$(gh completion -s fish)"
  
  

  ### for gaudiy k8s
  alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'

  
  ### for starship(prompt custom)
  starship init fish | source

end


function fzf-checkout-branch
    set -l branchname (
        env FZF_DEFAULT_COMMAND='git --no-pager branch -a | grep -v HEAD | sed -e "s/^.* //g"' \
            fzf --height 70% --prompt "BRANCH NAME>" \
                --preview "git --no-pager log -20 --color=always {}"
    )
    if test -n "$branchname"
        git checkout (echo "$branchname"| sed "s#remotes/[^/]*/##")
    end
end

function fzf-docker-continer-name-select
    commandline -i (env FZF_DEFAULT_COMMAND="docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Command}}\t{{.RunningFor}}\t{{.Ports}}\t{{.Networks}}'" \
        fzf --no-sort --height 80% --bind='p:toggle-preview' --preview-window=down:70% \
            --preview '
                set -l containername (echo {} | awk -F " " \'{print $2}\');
                if test "$containername" != "ID"
                    docker logs --tail 300 $containername
                end
            ' | \
        awk -F " " '{print $2}')
end


