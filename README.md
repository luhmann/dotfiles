# luhmanns Dotfiles

## Features

- Bootstrap script (`bootstrap.bash`) that syncs dotfiles to home dir, installs latest fish with Homebrew if missing and applies fish settings (universal vars)
- [Slate](https://github.com/jigish/slate) settings (minimal for now)
- Homebrew formulae (`brew.bash`)
- Homebrew install (`nonbrew.bash`)
- Nom Packages
- Python Packages
- OSX settings (`osx.bash`)


## Installation

Prerequisite: Homebrew.

1. `./bootstrap.bash` (or `./bootstrap.bash -f` to avoid the confirmation prompt)
2. If necessary, add fish to the system shells and make it your default shell:
    - Add `/usr/local/bin/fish` to `/etc/shells`
    - `chsh -s /usr/local/bin/fish`



## Thanks
Forked from https://github.com/sgoumaz/dotfiles
