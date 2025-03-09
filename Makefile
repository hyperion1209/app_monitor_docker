docker:
	@DOCKER_BUILDKIT=1 docker build \
		--progress=plain \
		--tag app_monitor \
		.

docker-force:
	@DOCKER_BUILDKIT=1 docker build \
		--progress=plain \
		--no-cache \
		--tag app_monitor \
		.
