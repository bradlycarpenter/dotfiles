session_root "~/Code/expense-tracker/"

if initialize_session "tracker"; then

	new_window "run"
  	run_cmd "cd back-end"
	run_cmd "pnpm run test:watch"
	split_h
  	run_cmd "cd front-end"
	run_cmd "pnpm run test:watch"
	split_v
	run_cmd "cd front-end"
	run_cmd "pnpm run storybook"
	select_pane 0

	new_window "lazygit"
	run_cmd "lazygit"

	new_window "lazydocker"
	run_cmd "docker compose -f dev/docker-compose.yml up -d"
	run_cmd "lazydocker"
	select_window "run"

fi

finalize_and_go_to_session
