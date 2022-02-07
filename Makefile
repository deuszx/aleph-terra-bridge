build-deps: build-aleph build-localterra

build-aleph:
	cd aleph-node && \
	cargo build --release -p aleph-node && \
	docker build -t aleph-node -f docker/Dockerfile .

build-localterra:
	cd LocalTerra && \
	docker-compose pull

stop-localterra:
	cd LocalTerra && \
	docker-compose stop

update-deps:
	git submodule init && \
	git submodule update

# Clean the "world state" of the LocalTerra.
clean-localterra:
	cd LocalTerra && \
	docker-compose rm

start: start-aleph start-localterra

start-aleph:
	cd aleph-node/docker && \
	docker-compose up

start-localterra:
	cd LocalTerra && \
	docker-compose up