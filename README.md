# jfds Dotfiles

OSX, Homebrew, fish, git, Slate.


## Features

- Bootstrap script (`bootstrap.bash`) that syncs dotfiles to home dir, installs latest fish with Homebrew if missing and applies fish settings (universal vars)
- [Slate](https://github.com/jigish/slate) settings (minimal for now)
- Homebrew formulae (`brew.bash`)
- OSX settings (`osx.bash`)

The latter two borrow heavily from @mathiasbynens's [dotfiles](https://github.com/mathiasbynens/dotfiles).


## Installation

Prerequisite: Homebrew.

1. `./bootstrap.bash` (or `./bootstrap.bash -f` to avoid the confirmation prompt)
2. If necessary, add fish to the system shells and make it your default shell:
    - Add `/usr/local/bin/fish` to `/etc/shells`
    - `chsh -s /usr/local/bin/fish`



## Thanks
Forked from https://github.com/sgoumaz/dotfiles
