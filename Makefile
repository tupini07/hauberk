# Just a trivial makefile to shorten some common commands.

serve:
	dart run build_runner serve

build: docs
	dart run build_runner build --output web:build --release
	rm -rf gh-pages
	git clone --single-branch -b gh-pages \
			https://github.com/munificent/hauberk.git gh-pages
	cp -R build/ gh-pages
	rm -rf gh-pages/packages
	rm gh-pages/.build.manifest
	rm gh-pages/.packages

docs:
	dart bin/update_docs.dart

lint:
	dart analyze

.PHONY: docs serve
