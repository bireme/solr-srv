default: build

COMPOSE_FILE = docker-compose.yml

## docker-compose shortcuts
run:
	@docker-compose -f $(COMPOSE_FILE) up

start:
	@docker-compose -f $(COMPOSE_FILE) up -d

logs:
	@docker-compose -f $(COMPOSE_FILE) logs -f

stop:
	@docker-compose -f $(COMPOSE_FILE) stop

ps:
	@docker-compose -f $(COMPOSE_FILE) ps

shell:
	@docker-compose -f $(COMPOSE_FILE) exec solr sh

zk_upconfig:
	docker-compose -f $(COMPOSE_FILE) exec solr  bin/solr zk upconfig -n fi-admin -d server/solr/configsets/fi-admin/

create_fi_admin_collection:
	docker-compose -f $(COMPOSE_FILE) exec solr  bin/solr create_collection -c fi-admin -d fi-admin -shards 3 -replicationFactor 2
