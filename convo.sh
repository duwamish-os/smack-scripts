#!/bin/sh

tmux new-session -d -s convo ;
tmux split-window -h ;

tmux select-pane -L
tmux send-keys -t convo 'echo "Hi how can I help you?"' C-m

tmux select-pane -R
tmux send-keys -t convo 'tail -f /usr/local/apache-tomcat-8.5.12/logs/catalina.out' C-m

tmux attach-session -d -t convo
