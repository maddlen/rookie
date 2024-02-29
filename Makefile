# —— Inspired by ———————————————————————————————————————————————————————————————
# http://fabien.potencier.org/symfony4-best-practices.html
# https://speakerdeck.com/mykiwi/outils-pour-ameliorer-la-vie-des-developpeurs-symfony?slide=47
# https://blog.theodo.fr/2018/05/why-you-need-a-makefile-on-your-project/
# Setup ————————————————————————————————————————————————————————————————————————

# Executables
NPM           = npm

# Misc
.DEFAULT_GOAL = help
.PHONY        : # Not needed here, but you can put your all your targets to be sure
                # there is no name conflict between your files and your targets.

## —— Local 🐝 ———————————————————————————————————————————————————————————————
local: ## Launch all local services
	make -j 2 tailwind vite

tailwind: ## Tailwind watch
	npx tailwindcss -i ./input.css -o ./style.css --watch

vite: ## Watch frontend
	$(NPM) run dev

## —— Deploy & Prod 🚀 —————————————————————————————————————————————————————————
heroku:
	git push heroku master

## —— Setup 🚧 —————————————————————————————————————————————————————————
setup:
	$(NPM) install
npm-install:
	$(NPM) install
