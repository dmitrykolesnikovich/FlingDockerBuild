DockerBuildFlags=staging

ifdef DEV_BRANCH
	DockerBuildFlags=$(DEV_BRANCH)
endif

### Build the base image, this must happen first before building anything else!
build-base:
	@docker build -t fling_build_base --build-arg DEV_BRANCH=$(DockerBuildFlags) ./build_base;

### Clang ###
build-clang:
	@make build-base; \
	docker build -t fling_build_clang --build-arg DEV_BRANCH=$(DockerBuildFlags) ./build_clang; 
test-clang:
	@make build-clang; docker run fling_build_clang ./FlingTests/bin/FlingTests;

### GCC ### 
build-gcc:
	@make build-base; docker build -t fling_build_gcc --build-arg DEV_BRANCH=$(DockerBuildFlags) ./build_gcc;
test-gcc:
	@make build-gcc; docker run fling_build_gcc ./FlingTests/bin/FlingTests;

# Run CPP check (static analysis)
build-cppcheck:
	@docker build -t fling_build_cppcheck --build-arg DEV_BRANCH=$(DockerBuildFlags) ./build_cppcheck

clean-images:
	@docker rmi `docker images -q -f "dangling=true"`
