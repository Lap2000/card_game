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

colors: ## すべての色を表示する
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
setup: ## プロジェクトのセットアップ
	@echo "${GREEN}╠ プロジェクトのセットアップ${RESET}"
	@flutter pub get
	@flutter pub run easy_localization:generate -S assets/langs -f keys -O lib/gen -o locale_keys.g.dart
	@flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: gen
gen: ## ワンタイムコード生成をトリガーする
	@echo "${BLUE}コードの生成。。。。${RESET}"
	@flutter pub run build_runner build --delete-conflicting-outputs
	@flutter pub run easy_localization:generate -S assets/translations -f keys -O lib/gen -o locale_keys.g.dart

.PHONY: languages
languages:
	@echo "${BLUE}。。。。${RESET}"
	@flutter pub run easy_localization:generate -S assets/translations -f keys -O lib/gen -o locale_keys.g.dart

.PHONY: analyze
analyze: ## コードを分析する
	@flutter analyze
	@flutter pub run dart_code_metrics:metrics analyze lib

.PHONY: format
format: ## コードのフォーマット
	@echo "${YELLOW}╠ コードのフォーマット${RESET}"
	@dart format .

.PHONY: lint
lint: ## コードをリントします
	@echo "${YELLOW}╠ コードを確認しています。。。。${RESET}"
	@dart analyze . || (echo "${RED}プロジェクトのエラー${RESET}"; exit 1)

.PHONY: upgrade
upgrade: clean ## 依存関係をアップグレードする
	@echo "${LIGHTPURPLE}╠ 依存関係をアップグレード中。。。${RESET}"
	@flutter pub upgrade

.PHONY: clean
clean: ## 環境をきれいにします。
	@echo "${YELLOW}╠ プロジェクトをクリーニング中。。。。${RESET}"
	@rm -rf pubspec.lock
	@flutter clean

.PHONY: delete generated file
delete-generate-file: ## コード生成を削除
	@echo "コード生成を削除"
	@find . -maxdepth 20 -type f \( -name "*.freezed.dart" -o  -name "*.g.dart" \) -delete