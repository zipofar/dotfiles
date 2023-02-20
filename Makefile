# ANSIBLE_PREFIX := docker run -v $(HOME):/host/home -v $(CURDIR):/dotfiles -w /dotfiles williamyeh/ansible:ubuntu18.04 ansible-playbook -i local -vv

all: nvim-install dotfiles-install

TAGS := all

dotfiles-install:
	# $(ANSIBLE_PREFIX) dotfiles.yml
	docker run --rm -e RUNNER_PLAYBOOK=dotfiles.yml -v $(HOME):/host/home -v $(CURDIR):/runner/project ansible/ansible-runner

nvim-install:
	mkdir -p ~/.config/nvim
	ln -s $(PWD)/files/vimrc ~/.config/nvim/init.vim | true
	ln -s $(PWD)/files/coc-settings.json ~/.config/nvim/coc-settings.json | true

macos-prepare:
	brew install the_silver_searcher fzf bat htop fd ncdu tldr httpie

deps: deps-gem deps-composer deps-npm deps-pip

deps-pip:
	pip2 install --upgrade pynvim
	pip3 install --upgrade pynvim

deps-gem:
	gem install solargraph rubocop neovim
	gem install rubocop-rspec rubocop-rails rubocop-performance

deps-composer:
	composer global require "squizlabs/php_codesniffer=*"

deps-npm:
	npm install -g neovim
	npm install -g prettier eslint babel-eslint
	npx install-peerdeps -g eslint-config-airbnb
	npm install -g stylelint stylelint-config-recommended stylelint-config-standard

install-configs:
	ln -s $(PWD)/files/.gitconfig ~/.gitconfig | true
	ln -s $(PWD)/files/.gitexcludes ~/.gitexcludes | true
	ln -s $(PWD)/files/.tmux.conf ~/.tmux.conf | true
	mkdir -p ~/.config/nvim/UltiSnips
	ln -s $(PWD)/files/vim_snippets/ruby.snippets ~/.config/nvim/UltiSnips/ruby.snippets | true
