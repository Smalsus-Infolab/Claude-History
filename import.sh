#!/bin/bash
# Usage: ./import.sh <name> [your-folder]
# Puts chats/<name>/ into your Claude Code so `claude --resume` shows them.
# your-folder = any folder on your computer (default: current folder). It is created if missing.
set -e
NAME="$1"; [ -d "chats/$NAME" ] || { echo "Usage: ./import.sh <name>   (available: $(ls chats | tr '\n' ' '))"; exit 1; }
NEW="$(cd "${2:-.}" 2>/dev/null && pwd || { mkdir -p "$2" && cd "$2" && pwd; })"
OLD="$(cat "chats/$NAME/ORIGIN")"
DST=~/.claude/projects/$(echo "$NEW" | sed 's#[^a-zA-Z0-9]#-#g')
mkdir -p "$DST"
for f in chats/"$NAME"/*.jsonl; do sed "s#$OLD#$NEW#g" "$f" > "$DST/$(basename "$f")"; done
echo "Done. Now run:  cd \"$NEW\" && claude --resume"
