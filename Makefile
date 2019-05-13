init: up reset-db

up:
	docker-compose up -d --build

down:
	docker-compose down

reset-db:
	docker-compose exec ruby rails db:reset