# accept xcode license
sudo xcodebuild -license accept

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# macvim (requires xcode to be installed)
brew install macvim --env-std --with-override-system-vim

# scmpuff
brew install scmpuff

# oh my zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv -f .zshrc .zshrc.orig
mv -f .zshrc.pre-oh-my-zsh .zshrc

# powerline fonts
git clone https://github.com/powerline/fonts.git

# powerline
brew install python
pip install powerline-status

# youcompleteme
brew install cmake
cd ~/.vim/plugged/YouCompleteMe
./install.py

# z
brew install z

# git
brew install git
brew install git-lfs
git lfs install
sudo git lfs install --system

# ctags - https://www.sitepoint.com/effective-rails-development-vim/
brew install ctags # run in each project root: ctags -R --exclude=.git --exclude=log *

