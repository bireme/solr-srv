default: build

COMPOSE_FILE = docker-compose.yml

core?=test
container?=solr9-srv1


## docker-compose shortcuts
run:
	@docker-compose -f $(COMPOSE_FILE) up

start:
	@docker-compose -f $(COMPOSE_FILE) up -d

logs:
	@docker-compose -f $(COMPOSE_FILE) logs -f

stop:
	@docker-compose -f $(COMPOSE_FILE) stop

rm:
	@docker-compose -f $(COMPOSE_FILE) rm

ps:
	@docker-compose -f $(COMPOSE_FILE) ps

shell:
	@docker-compose -f $(COMPOSE_FILE) exec --user solr solr sh

update_configsets:
	docker  cp ./conf/configsets/ $(container):/bitnami/solr/server/solr/

create_core:
	docker-compose -f $(COMPOSE_FILE) exec -T solr /opt/bitnami/solr/bin/solr create_core -c $(core) -d $(core)

update_core_config:
	docker cp ./conf/configsets/$(core)/conf/ $(container):/bitnami/solr/server/solr/$(core)/

zk_upconfig:
	docker-compose -f $(COMPOSE_FILE) exec -T solr /opt/bitnami/solr/bin/solr zk upconfig -n fi-admin -d server/solr/configsets/fi-admin/

create_fi_admin_collection_cloud:
	docker-compose -f $(COMPOSE_FILE) exec -T solr /opt/bitnami/solr/bin/solr create_collection -c fi-admin -d fi-admin -shards 3 -replicationFactor 2

