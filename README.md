# Nvim config

This is my new config for neovim with lua. This is based in other configs and was modified
to my way.

## Setup

First, we need to install a package manager, in this case it'd be
[packer.nvim](https://github.com/wbthomason/packer.nvim). Follow the instructions to install it.

## Plugins

You can see the plugins in [lua/plugins](./lua/plugins.lua) file, but for some plugins is need
to install the following programs

### nvim-tressiter

For tressiter, we need a C compiler installed in your OS. If you are windows user, read [this](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support) for more information.

### telescope

We need to install

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)


### DBUI (Databases connections)

Connections strings for connect to databases is like following:

${DB_CONNECTION}://${DB_USER}:${DB_PASSWORD}@${DB_SERVER}:${DB_PORT}/${DB_DATABASE}?${DB_PARAMETER_1}&${DB_PARAMETER_2}...&${DB_PARAMETER_N}

Where

- DB_CONNECTION
sqlserver, mysql, postgresql, etc
You can specify the driver connection like -> jdbc:sqlserver
- DB_SERVER
Your server, for example `localhost` or some IP
- DB_PORT
Port of your server
- DB_DATABASE
Name of database that you want to connect
- DB_PARAMETER_1, DB_PARAMETER_2, DB_PARAMETER_N
Parameters to pass to dabase. It can be any number of parameters

You can specify this parameters in some env file for each project, thanks
to [dotenv.vim](https://github.com/tpope/vim-dotenv)

For example, to connect to sql server database

`sqlserver://username:password@localhost:1433/DatabaseName?trustServerCertificate=true`
