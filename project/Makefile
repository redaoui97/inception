all: build up
re : clean all
build :
	mkdir -p -m 777 /home/rnabil/data/mariadb
	mkdir -p /home/rnabil/data/wordpress
	docker compose -f srcs/docker-compose.yml build
restart:
	docker compose -f srcs/docker-compose.yml restart
up:
	docker compose -f srcs/docker-compose.yml up 
down:
	docker compose -f srcs/docker-compose.yml down
#rm using docjker rmi $(docker images -a -q) or something
clean: rm_volumes_content
	docker compose -f srcs/docker-compose.yml down
	docker rmi -f $(docker images -q)
rm_volumes_content:
	rm -rf /home/rnabil/data/mariadb/*
	rm -rf /home/rnabil/data/wordpress/*