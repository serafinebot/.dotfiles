# .dotfiles

## Dependencies
- GNU stow
- Neovim>=0.6.0

## Setup
```shell
git clone git@github.com:hexdhog/.dotfiles.git ~/.dotfiles
```

### ZSH
```shell
cd $HOME
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
cd -
cp $HOME/.dotfiles/resources/zsh/.oh-my-zsh/themes/* $HOME/.oh-my-zsh/themes/
```

### Install
```shell
cd $HOME/.dotfiles
./install.sh
```
