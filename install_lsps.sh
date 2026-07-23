#!/bin/bash

brew install lua-language-server
rustup component add rust-analyzer

pnpm i -g typescript typescript-language-server pyright bash-language-server vscode-langservers-extracted @olrtg/emmet-language-server dockerfile-language-server-nodejs @fsouza/prettierd tombi
pnpm add --save-dev --save-exact prettier@3.9.6

go install mvdan.cc/gofumpt@latest
go install github.com/reteps/dockerfmt@latest
go install golang.org/x/tools/gopls@latest

pip install beautysh blue ruff
cargo install stylua --features lua54
