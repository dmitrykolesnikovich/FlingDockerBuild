build-base:
	@docker build -t fling_build_base ./build_base;
build-clang:
	@docker build -t fling_build_clang ./build_clang; 
build-gcc:
	@docker build -t fling_build_gcc ./build_gcc;
build-cppcheck:
	@docker build -t fling_build_cppcheck ./build_cppcheck

clean-images:
	@docker rmi `docker images -q -f "dangling=true"`
