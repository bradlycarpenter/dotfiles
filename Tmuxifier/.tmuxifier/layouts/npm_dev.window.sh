# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/npm_dev"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "npm_dev"
run_cmd "npm run dev"
split_h
run_cmd "npm run studio"
select_pane 0
