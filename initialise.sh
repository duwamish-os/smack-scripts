function conversation-init {
  echo "$1"
}

function conversation-init-tmux {
  tmux new-session -d -s conversation-session ;
  tmux split-window -v ;
  tmux rename-window 'Conversation client'

  tmux select-pane -U
  tmux send-keys -t conversation-session 'echo "Starting conversation..."' C-m
  tmux send-keys -t conversation-session 'echo "Bot: Hi, how can I help you, $1"' C-m

  tmux attach-session -d -t conversation-session
}

#conversation-init $1
conversation-init-tmux $1
