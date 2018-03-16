#!/bin/sh

DEST_DIR="$HOME/.config/systemd/user"

if [ $(uname) = "Linux" ]; then
  mkdir -p "${DEST_DIR}"

  for file in "${PWD}/*.service"; do
    cp -f $file "${DEST_DIR}"
  done

  for file in "${PWD}/*.timer"; do
    cp -f $file "${DEST_DIR}"
  done

  systemctl --user daemon-reload
fi
