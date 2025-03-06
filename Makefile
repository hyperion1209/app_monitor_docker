docker:
	@DOCKER_BUILDKIT=1 docker build \
		--progress=plain \
		--tag app_monitor \
		.
