# Nvim config

This is my new config for neovim with lua. This is based in other configs and was modified
to my way.

## Setup

First, we need to install a package manager, in this case it'd be
[packer.nvim](https://github.com/wbthomason/packer.nvim). Follow the instructions to install it.

## Requirements for plugins

You can see the plugins in [lua/plugins](./lua/plugins.lua) file, but for some plugins is need
to install the following programs

### nvim-tressiter

For tressiter, we need a C compiler installed in your OS. If you are windows user, read [this](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support) for more information.

### telescope

We need to install

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [fd](https://github.com/sharkdp/fd)
