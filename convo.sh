#!/bin/sh

tmux new-session -d -s convo ;
tmux split-window -h ;

tmux select-pane -L
tmux send-keys -t convo 'echo hi' C-m

tmux select-pane -R
tmux send-keys -t convo 'top' C-m

tmux attach-session -d -t convo
