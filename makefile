
build:
	@docker build -t fling_build_base ./build_base; docker-compose -p fling_build build;

run:
	@docker-compose -p fling_build up
run-d:
	@docker-compose -p fling_build up -d
run-win:
	@docker-compose -p fling_build up -d
stop:
	@docker-compose -p fling_build down
clean-data: 
	@docker-compose -p fling_build down -v
clean-images:
	@docker rmi `docker images -q -f "dangling=true"`
ps:
	@docker-compose -p fling_build ps