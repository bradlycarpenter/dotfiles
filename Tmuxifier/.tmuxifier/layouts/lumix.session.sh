session_root "~/Code/lumix/serverless/"

if initialize_session "lumix"; then
	new_window "run"	
	run_cmd "npm run dev"
	split_h
	run_cmd "npm run studio"
	select_pane 0

	# Separate windows approach
	new_window "lazygit"
	run_cmd "lazygit"

	new_window "lazydocker"
	run_cmd "docker compose -f docker_files/docker-compose.yml up -d"
	run_cmd "lazydocker"
	select_window "run"
fi

finalize_and_go_to_session