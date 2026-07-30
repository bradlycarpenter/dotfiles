#!/usr/bin/env zsh
input=$(cat)

ctx=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

parts=()
[ -n "$ctx" ]  && parts+=("ctx:$(printf '%.0f' "$ctx")%")
[ -n "$five" ] && parts+=("5h:$(printf '%.0f' "$five")%")
[ -n "$week" ] && parts+=("7d:$(printf '%.0f' "$week")%")

printf '%s' "${(j: | :)parts}"
