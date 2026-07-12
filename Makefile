.DEFAULT_GOAL := help

.PHONY: help bootstrap install sync update-plugins

help:
	@printf 'Available targets:\n'
	@printf '  make bootstrap      Install base packages and copy dotfiles into $$HOME\n'
	@printf '  make install        Copy tracked dotfiles into $$HOME\n'
	@printf '  make sync           Sync local dotfiles from $$HOME back into the repo\n'
	@printf '  make update-plugins Refresh lazy-lock.json in an isolated temp workspace\n'

bootstrap:
	./scripts/bootstrap.sh

install:
	./scripts/install.sh

sync:
	./scripts/sync-from-home.sh

update-plugins:
	./scripts/update-plugins.sh
