session_root "~/Code/expense-tracker/"

if initialize_session "tracker"; then

	new_window "run"
  run_cmd "cd back-end"
	split_h
  run_cmd "cd front-end"
	select_pane 0

	new_window "lazygit"
	run_cmd "lazygit"

	new_window "lazydocker"
	run_cmd "docker compose -f dev/docker-compose.yml up -d"
	run_cmd "lazydocker"
	select_window "run"

fi

finalize_and_go_to_session
