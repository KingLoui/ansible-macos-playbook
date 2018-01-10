#!/bin/bash

echo "Installing Sublime Text Config"

LIB_DIR="$HOME/Library/Application Support/Sublime Text 3"
CONFIG_DIR="$LIB_DIR/Packages/User"
PACKAGE_CONTROL_URL='https://packagecontrol.io/Package Control.sublime-package'
PACKAGE_DIR="$LIB_DIR/Installed Packages"

# Install Package Control
	echo "Installing Sublime Text Package Control"
	mkdir -p "$PACKAGE_DIR"
	cd "$PACKAGE_DIR" && { curl -O "$PACKAGE_CONTROL_URL" ; cd -; }

# Install Config
	echo "Installing Sublime Text configs"
	mkdir -p "$CONFIG_DIR"
	# main config file
	cp "./config/Preferences.sublime-settings" "$CONFIG_DIR/Preferences.sublime-settings"
	# package control packages config
	cp "./config/Package Control.sublime-settings" "$CONFIG_DIR/Package Control.sublime-settings"
	# keymaps
	cp "./config/Default (OSX).sublime-keymap" "$CONFIG_DIR/Default (OSX).sublime-keymap"
	# build systems
	cp "./config/MyMake.sublime-build" "$CONFIG_DIR/MyMake.sublime-build"


# set Sublime Text as standard file opener for plain-text files
	defaults write com.apple.LaunchServices LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.sublimetext.3;}'

# Add to dock
	#sudo -u $real_user defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Sublime Text.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"; killall Dock
	