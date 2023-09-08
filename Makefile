# define standard colors
ifneq (,$(findstring xterm,${TERM}))
	BLACK        := $(shell tput -Txterm setaf 0)
	RED          := $(shell tput -Txterm setaf 1)
	GREEN        := $(shell tput -Txterm setaf 2)
	YELLOW       := $(shell tput -Txterm setaf 3)
	LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
	PURPLE       := $(shell tput -Txterm setaf 5)
	BLUE         := $(shell tput -Txterm setaf 6)
	WHITE        := $(shell tput -Txterm setaf 7)
	RESET := $(shell tput -Txterm sgr0)
else
	BLACK        := ""
	RED          := ""
	GREEN        := ""
	YELLOW       := ""
	LIGHTPURPLE  := ""
	PURPLE       := ""
	BLUE         := ""
	WHITE        := ""
	RESET        := ""
endif

# set target color
TARGET_COLOR := $(BLUE)

POUND = \#

.PHONY: no_targets__ info help build deploy doc
	no_targets__:

.DEFAULT_GOAL := help

colors: ## All colors
	@echo "${BLACK}BLACK${RESET}"
	@echo "${RED}RED${RESET}"
	@echo "${GREEN}GREEN${RESET}"
	@echo "${YELLOW}YELLOW${RESET}"
	@echo "${LIGHTPURPLE}LIGHTPURPLE${RESET}"
	@echo "${PURPLE}PURPLE${RESET}"
	@echo "${BLUE}BLUE${RESET}"
	@echo "${WHITE}WHITE${RESET}"

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup: ## Project setup
	@echo "${GREEN}╠ Project setup${RESET}"
	@flutter pub get
	@flutter pub run easy_localization:generate -S assets/langs -f keys -O lib/gen -o locale_keys.g.dart
	@flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: gen
gen: ## Gen code
	@echo "${BLUE}Generate code。。。。${RESET}"
	@flutter pub run build_runner build --delete-conflicting-outputs
	@flutter pub run easy_localization:generate -S assets/translations -f keys -O lib/gen -o locale_keys.g.dart

.PHONY: languages
languages: ## Gen languages
	@echo "${BLUE}。。。。${RESET}"
	@flutter pub run easy_localization:generate -S assets/translations -f keys -O lib/gen -o locale_keys.g.dart

.PHONY: analyze
analyze: ## Analyze the code
	@flutter analyze
	@flutter pub run dart_code_metrics:metrics analyze lib

.PHONY: format
format: ## Format code
	@echo "${YELLOW}╠ Format code${RESET}"
	@dart format .

.PHONY: lint
lint: ## Lint code
	@echo "${YELLOW}╠ Lint code。。。。${RESET}"
	@dart analyze . || (echo "${RED}Project error${RESET}"; exit 1)

.PHONY: upgrade
upgrade: clean ## Pub upgrade
	@echo "${LIGHTPURPLE}╠ Pub upgrade。。。${RESET}"
	@flutter pub upgrade

.PHONY: clean
clean: ## clean
	@echo "${YELLOW}╠ Cleaning。。。。${RESET}"
	@rm -rf pubspec.lock
	@flutter clean

.PHONY: delete generated file
delete-generate-file: ## Delete generated file
	@echo "Delete generated files"
	@find . -maxdepth 20 -type f \( -name "*.freezed.dart" -o  -name "*.g.dart" \) -delete