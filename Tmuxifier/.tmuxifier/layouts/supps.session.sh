session_root "~/Code/supps"

if initialize_session "supps"; then

  load_window "npm_dev"

  new_window "git"
  run_cmd "lazygit"
  
  load_window "docker"

  select_window 0

fi

finalize_and_go_to_session
