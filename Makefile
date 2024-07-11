OS := $(shell uname)
VOLS=$(docker volume ls -q)
ifeq ($(OS), Darwin) # Mac OS
    WP_VOLUME_DIR=/Users/$(USER)/data/wordpress
    MDB_VOLUME_DIR=/Users/$(USER)/data/mariadb
else ifeq ($(OS), Linux) # Linux
    WP_VOLUME_DIR=/home/$(USER)/data/wordpress
    MDB_VOLUME_DIR=/home/$(USER)/data/mariadb
endif

all: create-volumes
	docker-compose -f ./srcs/docker-compose.yml up  --build -d
create-volumes:
	@if [ ! -d "$(MDB_VOLUME_DIR)" ]; then \
		mkdir -p $(MDB_VOLUME_DIR); \
	fi
	@if [ ! -d "${WP_VOLUME_DIR}" ]; then \
		mkdir -p $(WP_VOLUME_DIR); \
	fi
up:
	docker-compose -f ./srcs/docker-compose.yml up -d
down:
	docker-compose -f ./srcs/docker-compose.yml down
clean:
	docker-compose -f ./srcs/docker-compose.yml down -v

re: clean all


fclean: clean
	docker system prune -a -f
	docker volume prune -f
	# docker volume rm $(VOLS)
	docker network prune -f
	docker container prune -f
	docker image prune -f
	sudo rm -rf WP_VOLUME_DIR
	sudo rm -rf MDB_VOLUME_DIR








