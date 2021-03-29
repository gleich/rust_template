# hadolint ignore=DL3007
FROM rust:latest AS builder

# Meta data
LABEL maintainer="project_author_email"
LABEL description="project_description"

# File copy
COPY . /usr/src/app
WORKDIR /usr/src/app

# Binary build
RUN cargo install --force cargo-make
RUN cargo make build-rust-prod

# Copy of binary to smaller image
# hadolint ignore=DL3006,DL3007
FROM alpine:latest
WORKDIR /
COPY --from=builder /usr/src/app/target/release/project_name .
CMD ["./project_name"]
