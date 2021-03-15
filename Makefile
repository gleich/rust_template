#########
# Build #
#########

build: build-prod build-dev build-docker-prod build-docker-dev
build-docker: build-docker-prod build-docker-dev

build-prod:
	cargo build --release

build-dev:
	cargo build

build-docker-prod:
	docker build -f docker/prod.Dockerfile -t docker_username/project_name:latest .

build-docker-dev:
	docker build -f docker/dev.Dockerfile -t docker_username/project_name:dev .

########
# Lint #
########

lint: lint-rust lint-dockerfiles

lint-rust:
	cargo fmt

lint-dockerfiles:
	hadolint docker/Dockerfile
	hadolint docker/dev.Dockerfile
