#!/bin/bash

# Install Homebrew
if ! command -v brew &> /dev/null
then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Add brew to $PATH
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jirachi/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install fish shell
if ! command -v fish &> /dev/null
then
	brew install fish
fi

# Set fish to default shell
if ! grep -Fxq "/opt/homebrew/bin/fish" /etc/shells &> /dev/null
then
	echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
	chsh -s /opt/homebrew/bin/fish 
fi

# Install rust
if ! command -v rustup &> /dev/null
then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	
	source $HOME/.cargo/env

	rustup override set stable
	rustup update stable
fi

# Install Alacritty
# cd ./alacritty
# make app
# cp -r target/release/osx/Alacritty.app /Applications/

