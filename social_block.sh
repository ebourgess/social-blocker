#!/bin/bash

HOSTS_FILE="/etc/hosts"
BLOCKLIST="$HOME/.blocklist"
MARKER="# SOCIAL_MEDIA_BLOCK"

block() {
    sudo cp "$HOSTS_FILE" "$HOSTS_FILE.bak"
    echo "$MARKER START" | sudo tee -a "$HOSTS_FILE" > /dev/null
    while read -r domain; do
        echo "127.0.0.1 $domain" | sudo tee -a "$HOSTS_FILE" > /dev/null
    done < "$BLOCKLIST"
    echo "$MARKER END" | sudo tee -a "$HOSTS_FILE" > /dev/null
    echo "[✓] Sites blocked."
}

unblock() {
    sudo cp "$HOSTS_FILE" "$HOSTS_FILE.bak"
    sudo sed -i.bak "/$MARKER START/,/$MARKER END/d" "$HOSTS_FILE"
    echo "[✓] Sites unblocked."
}

case "$1" in
    block)
        block
        ;;
    unblock)
        unblock
        ;;
    *)
        echo "Usage: $0 [block|unblock]"
        exit 1
        ;;
esac