
session_root "~/Code/mcp_warp"

if initialize_session "mcp"; then

  new_window "dev"
  run_cmd "cd mcp_golang"
  run_cmd "fresh"
  
  new_window "lazygit"
  run_cmd "lazygit"

  new_window "db"
  run_cmd "lazysql"
  
  new_window "ai"
  run_cmd "gemini"

  select_window 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
