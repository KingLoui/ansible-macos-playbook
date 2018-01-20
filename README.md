# Ansible MacOS Playbook

This is the playbook I use after a clean install of MacOS to set everything up.

Advantages for me over using a shell script based setup

- I can run the playbook over and over again with the same results.
- Tasks are only executed when changes are needed.
- The documentation about what is done is right in the output,
  instead of only in the comments.
- When a task doesn't work anymore, for example after a new macOS release,
  I will know immediately which one and why.
- It helps me to improve my Ansible skills :)

My dotfiles are managed with [yadm](https://thelocehiliosan.github.io/yadm/)
and stored in a private git repository which is pulled in the first time
the playbook is run. The repository is private because it includes
sensitive data like private keys and GitHub tokens. This approach
allows me to only need the login data of the dotfiles repo
provider when setting up a computer from scratch.

## Installation

### Automated

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/KingLoui/ansible-macos-playbook/master/install.sh)"
```

### Manual

```bash
# Install Apple's Command Line Tools
xcode-select --install

# Install Homebrew (see http://brew.sh)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install ansible
brew install ansible

# Clone this repository
git clone https://github.com/KingLoui/ansible-macos-playbook.git

# Download requirements
ansible-galaxy install -r requirements.yml

# Run the playbook
ansible-playbook main.yml -i inventory -K

# Run specific roles of the playbook
ansible-playbook main.yml -i inventory -K --tags "dotfiles,homebrew"
```

### TODO

Configure finder sidebar
Configure mail accounts
Install:
	adobe stuff
	little snitch
	resilio sync
	safari uBlock origin
	transmit
	mailbutler
	parallels desktop
	clean my Mac
	debookee
	archiver
	office
	mathematica
	kaleidoscope
	fantastical
	lastpass safari extension

Allow khd, chunkwm and iterm2 in accessability services



## Acknowledgements

This playbook is heavily inspired by
[Jeff Geerling's mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook).
https://github.com/oxyc/mac-playbook
https://github.com/oxyc/dotfiles
https://github.com/p1xelHer0/dotfiles/
https://github.com/STAR-ZERO/dotfiles
