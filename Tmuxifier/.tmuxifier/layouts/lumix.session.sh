# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Code/lumix/serverless/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "lumix"; then
	new_window "run"	
	run_cmd "npm run dev"
	split_h
	run_cmd "npm run studio"

	# Separate windows approach
	new_window "lazygit"
	run_cmd "lazygit"

	new_window "lazydocker"
	run_cmd "docker compose -f docker_files/docker-compose.yml up -d"
	run_cmd "lazydocker"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
