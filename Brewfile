#Add some taps
tap homebrew/dupes
tap homebrew/versions
tap josegonzalez/homebrew-php
tap phinze/cask
tap karan/karan

update
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install findutils

# Install more recent versions of some OS X tools
install homebrew/dupes/grep

# install postgres as dependency for php
install postgres

# Install php and dependencies
install -v --with-fpm --with-mysql --disable-opcache --with-pgsql php56
install php56-xhprof
install php56-xdebug
install php56-mcrypt
install phpunit
install phpmd
install php-code-sniffer
install php-version

# Install python and dependencies
install python
install python3

# Install everything else
install ag
install autojump
install brew-cask
install bash
install dos2unix
install ffmpeg
install fish
reinstall --HEAD fzf
install git
install git-extras
install gitignore
install graphicsmagick --with-webp
install gnu-tar
install htop
install iftop
install jq
install legit
install mackup
install mariadb
install multitail
install ngrep
install node
install pv
install rbenv
install ruby-build
install ssh-copy-id
install vim --override-system-vi
install wget
install youtube-dl

cleanup
