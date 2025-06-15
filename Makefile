# -------------------------------------------------------------------
#  Makefile  – Équivalent de serve-site.bat pour environnements Unix
# -------------------------------------------------------------------
# Usage rapide :
#   make serve       # installe les gems puis lance Jekyll avec livereload
#   make deps        # (optionnel) installe/maj les gems seulement
#   make clean       # supprime le dossier _site et le cache Jekyll

# Variables configurables (écrasables via `make VAR=...`)
.DEFAULT_GOAL := serve
BUNDLE ?= bundle
JEKYLL ?= $(BUNDLE) exec jekyll

# -------------------------------------------------------------------
.PHONY: deps serve clean

## deps : installe ou met à jour les gems
deps:
	@echo "[INFO] bundle install..."
	$(BUNDLE) install

## serve : installe les gems puis lance le serveur Jekyll
serve: deps
	@echo "[INFO] $(JEKYLL) serve --livereload ..."
	$(JEKYLL) serve --livereload

## clean : supprime la sortie générée (_site) et le cache Jekyll
clean:
	rm -rf _site .jekyll-cache
	@echo "[INFO] Dossier _site et cache supprimés."
serve: deps
	$(JEKYLL) serve --livereload --force_polling
