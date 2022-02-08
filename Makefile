build-deps: build-aleph build-localterra

build-aleph:
	cd local-aleph && \
	make build-aleph-image

build-localterra:
	cd LocalTerra && \
	docker-compose pull

stop-localterra:
	cd LocalTerra && \
	docker-compose stop

stop-localaleph:
	cd local-aleph && \
	docker-compose stop

setup-deps:
	git submodule add --depth 1 https://github.com/deuszx/local-aleph && \
	git submodule add --depth 1 https://www.github.com/terra-money/LocalTerra && \
	git submodule init

update-deps:
	git submodule update --init --recursive && \
	cd local-aleph && \
	git fetch && git pull && \
	make update-aleph-node && \
	cd ../LocalTerra && \
	git fetch && git pull

# Clean the "world state" of the LocalTerra.
clean-localterra:
	cd LocalTerra && \
	docker-compose rm

start: start-aleph start-localterra

start-aleph:
	cd local-aleph && \
	docker-compose up

start-localterra:
	cd LocalTerra && \
	docker-compose up