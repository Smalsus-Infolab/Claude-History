# Claude-History

Shared Claude Code chats. Keep this repo **private**.

## Use someone's chats (import)
```bash
git clone https://github.com/Smalsus-Infolab/Claude-History && cd Claude-History
./import.sh spa ~/Documents/spa-chats     # any folder you like
cd ~/Documents/spa-chats && claude --resume
```
Always open Claude Code from that same folder to see the chats.

## Add your chats (export)
```bash
./export.sh /full/path/to/your/project name
# check chats/<name>/ for passwords/keys, then:
git add . && git commit -m "Add <name> chats" && git push
```
