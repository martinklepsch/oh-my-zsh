# Include user bin recursively
path+=( $HOME/.bin $HOME/.bin/**/*(/N) )

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
