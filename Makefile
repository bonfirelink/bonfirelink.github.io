.PHONY: install
install: _check_site
	cd sites/$(site) && npm install

.PHONY: start
start: _check_site
	cd sites/$(site) && npm start

.PHONY: test
test: _check_site
	cd sites/$(site) && npm run test

.PHONY: build
build: _check_site
	cd sites/$(site) && npm run build

.PHONY: publish
publish: _check_site
	bin/publish.sh -n $(site)

.PHONY: list
.SILENT: list
list:
	ls -1 sites | sed 's#/##'

.PHONY: _check_site
.SILENT: _check_site
_check_site:
	@if [ -z "$(site)" ]; then (echo "error: site was undefined"; exit 1); fi
	@if [ "$(site)" = common ]; then (echo "error: common is not a valid site"; exit 1); fi
	@if [ ! -d "sites/$(site)" ]; then (echo "error: site $(site) doesn't exist"; exit 1); fi
