all: build up
re : clean all
build :
	mkdir -p -m 777 /home/rnabil/data/mariadb /home/rnabil/data/wordpress
	docker-compose build 
restart:
	docker-compose restart
up:
	docker-compose up 
down:
	docker-compose down
run: build up
rm_volumes_content:
	rm -rf /home/rnabil/data/mariadb/*
	rm -rf /home/rnabil/data/wordpress/*
clean: rm_volumes_content down
	docker rmi -f $(docker images -q)
fclean: clean 
	rm -rf /home/rnabil/data
