default: build

COMPOSE_FILE = docker-compose.yml

## docker-compose shortcuts
run:
	@docker-compose -f $(COMPOSE_FILE) up

up:
	@docker-compose -f $(COMPOSE_FILE) up -d

logs:
	@docker-compose -f $(COMPOSE_FILE) logs -f

stop:
	@docker-compose -f $(COMPOSE_FILE) stop

ps:
	@docker-compose -f $(COMPOSE_FILE) ps

shell:
	@docker-compose -f $(COMPOSE_FILE) exec solr sh
