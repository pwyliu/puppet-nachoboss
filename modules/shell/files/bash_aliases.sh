alias clera="clear"
alias tmux='tmux -2'
alias venv='source venv/bin/activate'

# virtualenvwrapper
export WORKON_HOME=$HOME/envs
export PROJECT_HOME=$HOME/projects
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"