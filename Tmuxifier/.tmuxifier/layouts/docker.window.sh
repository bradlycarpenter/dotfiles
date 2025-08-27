new_window "docker"

run_cmd "docker compose -f docker/docker-compose.yml up -d"
run_cmd "lazydocker"