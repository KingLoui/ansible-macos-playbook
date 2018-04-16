# Ansible macOS Development Playbook

This playbook helps me setting up a new macOS based dev machine from scratch.

It does:

1. Install packages (via homebrew, pip, npm, composer, gem)
2. Install apps (via homebrew cask, Mac App Store)
3. Install my dotfiles (via yadm)
4. Install zsh and zsh-plugins
5. Install sublime-text configs
6. Enable khd hotkey daemon and chunkwm window manager services
7. Install Vim/Neovim plugins

My dotfiles are managed with [yadm](https://thelocehiliosan.github.io/yadm/)
and stored in separate git repository which is pulled in the first time
the playbook is run. 

## Installation

### Automated

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/kinglouie/ansible-macos-playbook/master/install.sh)"
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
git clone https://github.com/kinglouie/ansible-macos-playbook.git

# Download requirements
ansible-galaxy install -r requirements.yml

# Run the playbook
ansible-playbook main.yml -i inventory -K
```
### Only run specific tasks
```
ansible-playbook main.yml -i inventory -K --tags "dotfiles,homebrew"
```

## Things that still need to be done manually

### Configuration
1. Configure Finder Sidebar
2. Configure Mail accounts
3. Configure Resilio Sync
4. Configure Remote Desktop
5. Configure Little Snitch
6. Allow `chunkwm`, `khd` and `iTerm.app` Accessibility control under Security & Privacy preferences.
7. Symlink external dirs `find /Volumes/Data/Synced -maxdepth 1 -mindepth 1 -type d -exec ln -s '{}' ~/Synced \;`
8. Login
	- Lastpass
	- Firefox sync
	- Github
	- iStudiez Pro
	- Transmit
9. Install Licences
	- Tower
	- Adobe CC
	- Sublime Text
	- Hopper Disassembler
	- Mathematica

### Software to install
- Adobe CC
- Little Snitch
- Safari plugins
	- uBlock
	- LastPass
- Firefox plugins
	- uBlock
	- LastPass
	- Reddit Enhancement Suite
- Transmit
- Parallels Desktop
- CleanMyMac
- Debookee
- Archiver
- Microsoft Office
- Mathematica
- Kaleidoscope
- Fantastical

## TODO

#### Alfred
- http://www.packal.org/workflow/lastpass-cli-workflow-alfred
- http://www.packal.org/theme/neon-dreams
- http://www.packal.org/workflow/transmit
- https://www.alfredforum.com/topic/840-evernote-9-beta-2-for-alfred-3-search-create-append-set-reminders-all-within-alfred/
- https://github.com/robb/Fantastical-Alfred-Workflow
- http://jonohunt.tumblr.com/post/85815752538/alfred-workflow-to-add-tasks-to-remindersapp
- http://www.packal.org/workflow/github-repos
- https://github.com/willfarrell/alfred-encode-decode-workflow
- http://www.packal.org/workflow/whats-my-ip

## Acknowledgements

This playbook is inspired by:

- [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)
- [oxyc/mac-playbook](https://github.com/oxyc/mac-playbook)

