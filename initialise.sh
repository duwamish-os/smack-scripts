function conversation-init {
  echo "$1"
}

function conversation-init-tmux {
  tmux new-session -d -s conversation-session ;
  tmux split-window -v ;
  tmux rename-window 'Conversation client'

  tmux select-pane -U
  printf '\033]2;Conversation logs\033\\'
  tmux set -g pane-border-format "#{pane_index} #{pane_current_command}"
  tmux send-keys -t conversation-session 'echo "Starting conversation..."' C-m
  tmux send-keys -t conversation-session 'echo "Bot: Hi, how can I help you, $1"' C-m

  tmux send-keys -t conversation-session "docker_container=$(docker ps -aqf name=convo-api)" 'C-m' 'docker exec -it $docker_container bash' 'C-m'
  tmux send-keys -t conversation-session 'tail -f logs.dir_IS_UNDEFINED/application.log' C-m
 
  tmux select-pane -D
  tmux send-keys -t conversation-session "docker_container=$(docker ps -aqf name=convo-api)" 'C-m' 'docker exec -it $docker_container bash' 'C-m'
  tmux send-keys -t conversation-session 'tail -f logs/catalina*' C-m
  
  tmux attach-session -d -t conversation-session
}

#conversation-init $1
conversation-init-tmux $1
