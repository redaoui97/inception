all: build up
re : clean all
build :
	mkdir -p -m 777 /home/rnabil/data/mariadb /home/rnabil/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml build 
restart:
	docker-compose -f ./srcs/docker-compose.yml restart 
up:
	@docker-compose -f ./srcs/docker-compose.yml up -d
	@echo "containers are up"
down:
	@docker-compose -f ./srcs/docker-compose.yml  down
	@echo "containers are down"
run: build up
rm_volumes_content:
	rm -rf /home/rnabil/data/mariadb/*
	rm -rf /home/rnabil/data/wordpress/*
clean: rm_volumes_content down
	docker rmi -f $$(sudo docker images -q)
fclean: clean 
	rm -rf /home/rnabil/data
