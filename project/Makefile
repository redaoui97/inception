all: build up
re : clean all
build :
	mkdir -p -m 777 /home/rnabil/data/mariadb /home/rnabil/data/wordpress
	source .env
	docker compose -f srcs/docker-compose.yml build
restart:
	docker compose -f srcs/docker-compose.yml restart
up:
	docker compose -f srcs/docker-compose.yml up 
down:
	docker compose -f srcs/docker-compose.yml down
rm_volumes_content:
	rm -rf /home/rnabil/data/mariadb/*
	rm -rf /home/rnabil/data/wordpress/*
clean: rm_volumes_content down
	docker rmi -f $(docker images -q)
fclean: clean 
	rm -rf /home/rnabil/data