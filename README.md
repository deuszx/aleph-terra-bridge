# Aleph <-> Terra bridge testing repository.

## How to start.

Note that `docker-compose` is required.

1. Clone this repository.
2. Run the `make setup-deps` to clone the git submodules.
3. `make update-deps` to fetch latest state of both repos.
4. `make build-deps` to build Docker images for Aleph network and LocalTerra.
5. `make start-aleph` or `make start-localterra` to start either of the networks.
