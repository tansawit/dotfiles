# My macOS configuration files
> Karabiner, NeoVim, tmux, VS Code, Zsh

These are all the configuration files on my Mac

[![MIT](https://img.shields.io/badge/license-MIT-0a0a0a.svg?style=flat&colorA=0a0a0a)](LICENSE) [![Twitter](https://bit.ly/2m2Kb02)](https://twitter.com/tansawit)

## New Mac Install Steps

### Run Makefile

```bash
make all
```

### neovim

Install Vim Plugins:

Inside `init.vim`

```bash
:PlugInstall
```

#### Language Support

##### Go

In neovim

```bash
:GoInstallBinaries
```

##### Rust

In neovim

```bash
:CocInstall coc-rls
```

##### Python

In terminal

```bash
pip3 install neovim
```

### Set karabiner

Open Karabiner-Elements application:

- In the profile section, add the profile `JS`

In terminal, run:

```goku```
