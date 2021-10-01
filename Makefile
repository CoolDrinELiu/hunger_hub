COMPOSE = docker-compose
RAKE = ${COMPOSE} exec app bundle exec rake
RUN  = ${COMPOSE} run

run:
	@${COMPOSE} exec app bundle exec
start:
	@${COMPOSE} up -d
update:
	@${RUN} app /bin/sh -c "bundle exec rake assets:precompile RAILS_ENV=production"
	@${COMPOSE} stop
	@${COMPOSE} up -d
restart:
	@${COMPOSE} stop
	@${COMPOSE} start
stop:
	@${COMPOSE} stop