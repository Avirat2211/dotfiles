# dotfiles

My configs for zsh, neovim, tmux and kitty. They work on my machine, which is the only guarantee I can offer.

## What's here

- **zsh** - prompt, plugins, history settings
- **nvim** - my neovim setup, with LSP and a few plugins
- **tmux** - keybindings and a status bar
- **kitty** - terminal config and some themes I switch between when I get bored

## Using them

Each folder is set up for [GNU Stow](https://www.gnu.org/software/stow/):

```sh
git clone https://github.com/Avirat2211/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow zsh nvim tmux kitty
```

Back up your own configs first. Or don't, I'm not your boss.

Feel free to take whatever's useful.
