#!/bin/bash

brew install bash-language-server lua-language-server typescript-language-server pyright tombi rust-analyzer

pnpm i -g vscode-langservers-extracted @olrtg/emmet-language-server dockerfile-language-server-nodejs @fsouza/prettierd
pnpm add --save-dev --save-exact prettier@3.9.6

go install mvdan.cc/gofumpt@latest
go install github.com/reteps/dockerfmt@latest

pip install beautysh blue ruff
cargo install stylua --features lua54
