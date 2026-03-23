.PHONY: all init migrate up down

all: up

init:
	docker-compose up -d
	docker-compose exec db psql -U postgres -f /docker/init.sql

migrate:
	docker-compose exec db psql -U postgres -f /migrations/001_create_tables.sql

up:
	docker-compose up -d

down:
	docker-compose down