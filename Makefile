DOC = docker compose

run:
	@go run cmd/server/main.go

app:
	@$(DOC) exec app bash

up:
	@$(DOC) up

down:
	@$(DOC) down

stop:
	@$(DOC) stop

start:
	@$(DOC) start
