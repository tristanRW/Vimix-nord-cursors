#!/usr/bin/env bash

ROOT_UID=0
DEST_DIR=

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr/share/icons"
else
  DEST_DIR="$HOME/.local/share/icons"
  mkdir -p $DEST_DIR
fi

if [ -d "$DEST_DIR/Vimix-nord-cursors" ]; then
  rm -rf "$DEST_DIR/Vimix-nord-cursors"
fi

if [ -d "$DEST_DIR/Vimix-nord-white-cursors" ]; then
  rm -rf "$DEST_DIR/Vimix-nord-white-cursors"
fi

cp -r dist/ $DEST_DIR/Vimix-nord-cursors
cp -r dist-white/ $DEST_DIR/Vimix-nord-white-cursors

echo "Finished..."

