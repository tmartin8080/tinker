.PHONY: build
build:
	docker compose build 

.PHONY: start
start:
	docker compose up --remove-orphans
