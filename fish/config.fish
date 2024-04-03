# =============== #
#    FUNCTIONS    #
# =============== #
# Add ssh agent
eval (ssh-agent -c)>/dev/null 2>&1
ssh-add >/dev/null 2>&1

# Load custom methods
for file in $HOME/.config/fish/custom/*.fish
  . $file
end
for file in /opt/miniconda3/etc/fish/conf.d/*.fish
  . $file
end
set -g pure_symbol_prompt ">"


set -U Z_DATA              $HOME/.local/share/z/data
set -U Z_CMD               'zz'

set -U fish_user_paths $HOME/.local/bin $HOME/.local/npm-global/bin $HOME/.config/bin/platform-tools $HOME/.config/bin $HOME/.npm-global/bin $HOME/.local/lib/python3.9/site-packages/ $HOME/.codon/bin
set -aU fish_user_paths $HOME/go/bin $HOME/.config/bin/ $HOME/.cargo/bin
set -U ANDROID_SDK_ROOT $HOME/Android/Sdk
set -U ANDROID_HOME $HOME/Android/Sdk
set -Ux PYENV_ROOT $HOME/.pyenv

set -Ua fish_user_paths $HOME/Android/Sdk/emulator $HOME/Android/Sdk/tools $HOME/Android/Sdk/tools/bin $HOME/Android/Sdk/platform-tools
set -Ua fish_user_paths $HOME/.cache/git-fuzzy/bin
set -Ua fish_user_paths $HOME/.config/bin/fzf
set -Ua fish_user_paths $HOME/.poetry/bin
set -Ua fish_user_paths $PYENV_ROOT/bin

export EDITOR=lvim

# xdg-mime default nvim.desktop text/plain
# xdg-settings set default-web-browser qutebrowser.desktop
# set -U FZF_DEFAULT_COMMAND 'rg --files --hidden --follow'
# set -U FZF_DEFAULT_COMMAND 'rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
# set -xU FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git'
# set -Ua FZF_DEFAULT_COMMAND 'hello world'
# set -xU FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# eval (python -m virtualfish auto_activation)

set -U FZF_TMUX 1
set -xg BROWSER google-chrome-stable

### For Forgit
set -xU FORGIT_LOG_FZF_OPTS "--exact --border --reverse --height '100%' --preview 'bat --color=always --line-range=:500 {}'"

# set -x MSBuildSDKsPath (echo /usr/share/dotnet/sdk/6.*/Sdks )
set -x DONT_PROMPT_WSL_INSTALL 1
set -x DISABLE_QT5_COMPAT 1
set -x GDK_SCALE 2

set -x GH_TOKEN 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
set -x IPYTHONDIR ~/.config/ipython


zoxide init fish | source

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
pyenv init - | source

export PYTHONWARNINGS="ignore"
export JSII_SILENCE_WARNING_UNTESTED_NODE_VERSION=true
export YTFZF_SYSTEM_ADDON_DIR=/home/alpha/.config/ytfzf/addons

oh-my-posh init fish --config '~/.config/fish/oh-my-posh/pure.simple.omp.json' | source

export ROOTLESSKIT_PARENT_EUID=$(id -u)
export ROOTLESSKIT_PARENT_GID=$(id -g)
export WINEPREFIX=/home/alpha/.wine

export JAVA_HOME=/usr/lib/jvm/default
export TERM=xterm
