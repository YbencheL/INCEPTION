up:
	docker compose up --build
down:
	docker compose down -v

stop:
	docker compose stop

start:
	docker compose start

status:
	docker ps