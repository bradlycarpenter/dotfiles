#!/bin/bash

SESSION="lumix"
PROJECT_DIR="$HOME/Documents/Code/lumix/serverless/"

tmux kill-session -t $SESSION 2>/dev/null

tmux new-session -d -s "$SESSION" -n 'editor' -c "$PROJECT_DIR"

tmux send-keys -t "$SESSION:1" 'nvim' C-m
# Create a narrow right pane and capture its pane id
AGENT_PANE=$(tmux split-window -h -t "$SESSION:1" -c "$PROJECT_DIR" -p 15 -P -F "#{pane_id}")
# Run cursor agent in the newly created pane (not the Neovim pane)
tmux send-keys -t "$AGENT_PANE" "cursor-agent" C-m

tmux new-window -t "$SESSION:2" -n 'dev' -c "$PROJECT_DIR"
tmux send-keys -t "$SESSION:2" 'npm run dev' C-m
tmux split-window -h -t "$SESSION:2" -c "$PROJECT_DIR"
tmux send-keys -t "$SESSION:2" 'npm run studio' C-m

tmux new-window -t "$SESSION:3" -n 'lazygit' -c "$PROJECT_DIR"
tmux send-keys -t "$SESSION:3" 'lazygit' C-m

tmux new-window -t "$SESSION:4" -n 'docker' -c "$PROJECT_DIR"
tmux send-keys -t "$SESSION:4" 'lazydocker' C-m

tmux select-window -t "$SESSION:1"
tmux attach -t "$SESSION"

