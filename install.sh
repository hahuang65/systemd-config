#!/bin/sh

USER_DEST_DIR="$HOME/.config/systemd/user"
SYS_DEST_DIR="/etc/systemd/system/"

if [ $(uname) = "Linux" ]; then
	mkdir -p "${USER_DEST_DIR}"

	for file in "${PWD}/user/*.service"; do
		cp -f $file "${USER_DEST_DIR}"
	done

	for file in "${PWD}/user/*.timer"; do
		cp -f $file "${USER_DEST_DIR}"
	done

	for file in "${PWD}/system/*.service"; do
		sudo cp -f $file "${SYS_DEST_DIR}"
	done

	for file in "${PWD}/system/*.timer"; do
		sudo cp -f $file "${SYS_DEST_DIR}"
	done

	systemctl --user daemon-reload
	systemctl daemon-reload

	sudo systemctl enable powertop.service
	sudo systemctl start powertop.service
	sudo systemctl enable reflector.timer
	sudo systemctl start reflector.timer
fi
