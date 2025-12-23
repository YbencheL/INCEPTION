up:
	docker compose -f ./srcs/docker-compose.yml up -d --build
down:
	docker compose -f ./srcs/docker-compose.yml down -v

stop:
	docker compose -f ./srcs/docker-compose.yml stop

start:
	docker compose -f ./srcs/docker-compose.yml start

status:
	docker compose -f ./srcs/docker-compose.yml ps

logs:
	docker compose -f ./srcs/docker-compose.yml logs