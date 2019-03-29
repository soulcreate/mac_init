sudo pmset hibernatemode 0
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
defaults write -g com.apple.mouse.scaling 1

defaults write com.apple.menuextra.clock IsAnalog -bool true
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Volume.menu"
killall SystemUIServer

defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null

brew cask install telegram
brew cask install whatsapp
brew cask install WordService
brew install mc
echo 'export VISUAL=vim; export EDITOR="$VISUAL"' >> ~/.bashrc
