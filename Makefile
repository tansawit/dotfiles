.PHONY: help

help: ## Print command list
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

_prepare:
	@git submodule update --init --recursive

brew:
	@/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	@brew list

dotfiles:
	@./install -c config/install.conf.yaml

tools:
	@./install -c config/tmux.conf.yaml

all: _prepare brew dotfiles
