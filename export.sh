#!/bin/bash
# Usage: ./export.sh <project-path> [name]
# Copies your Claude Code chats for that project into chats/<name>/ so you can commit them.
# Example: ./export.sh /Users/me/office/spa spa
set -e
P="${1%/}"; NAME="${2:-$(basename "$P")}"
SRC=~/.claude/projects/$(echo "$P" | sed 's#[^a-zA-Z0-9]#-#g')
[ -d "$SRC" ] || { echo "No chats found at $SRC"; exit 1; }
mkdir -p "chats/$NAME"
cp "$SRC"/*.jsonl "chats/$NAME/"
echo "$P" > "chats/$NAME/ORIGIN"
echo "Exported $(ls "chats/$NAME"/*.jsonl | wc -l) chats to chats/$NAME. Check for secrets, then git add/commit/push."
