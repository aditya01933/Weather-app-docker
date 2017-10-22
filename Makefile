.PHONY: build
build: stop
	docker-compose up -d --build

.PHONY: start
start: 
	docker-compose up -d

.PHONY: stop
stop: 
	docker-compose stop

.PHONY: webconsole
webconsole:
	docker-compose run web rails c

.PHONY: weblogs
weblogs:	
	docker-compose logs -f web

.PHONY: import_cities
import_cities:
	docker-compose exec web bundle exec rake app_setup:import_cities
