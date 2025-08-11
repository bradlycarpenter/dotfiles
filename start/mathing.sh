#!/bin/bash

SESSION="mathing"
PROJECT_DIR="$HOME/Documents/Code/mathing/"

tmux kill-session -t $SESSION 2>/dev/null

tmux new-session -d -s "$SESSION" -n 'editor' -c "$PROJECT_DIR"

tmux send-keys -t "$SESSION:1" 'source .venv/bin/activate' C-m
tmux send-keys -t "$SESSION:1" 'nvim' C-m
tmux split-window -h -t "$SESSION:1" -c "$PROJECT_DIR" -p 15
tmux select-pane -t "$SESSION:1.1"

tmux new-window -t "$SESSION:2" -n 'lazygit' -c "$PROJECT_DIR"
tmux send-keys -t "$SESSION:2" 'lazygit' C-m

tmux select-window -t "$SESSION:1"
tmux attach -t "$SESSION"

