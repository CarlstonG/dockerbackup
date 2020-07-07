.PHONY: all # deploy
all: deploy

.PHONY: deploy # Pull the backend and the frontend from git then it recreates docker containers
deploy:
	(cd ../../backend && git pull)
	(cd ../../frontend && git pull)
	docker-compose up -d --force-recreate gw-frontend
	docker-compose up -d --force-recreate gw-backend
	docker-compose exec gw-backend php /tmp/composer.phar install
	docker-compose up -d --force-recreate gw-worker

# List all commands
.PHONY: help # Generate list of targets with descriptions
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1 -> \2/' | expand -t20
