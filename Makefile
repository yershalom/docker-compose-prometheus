up:
	docker-compose down
	docker-compose up -d
	@echo
	@echo
	@echo
	@echo Prom-Stack setup successfully!
	@echo
	@echo Prometheus:   http://localhost:9090
	@echo Grafana:      http://localhost:3000  \(User\: admin / Password\: foobar\)
	@echo Pushgateway:  http://localhost:9091
	@echo Alertmanager: http://localhost:9093
	@echo
	@echo

test:
	docker-compose up -d
	docker ps
	while ! curl --retry 10 --retry-delay 5 -v http://0.0.0.0:9090 >/dev/null; do sleep 1; done
  while ! curl --retry 10 --retry-delay 5 -v http://0.0.0.0:9093 >/dev/null; do sleep 1; done
  while ! curl --retry 10 --retry-delay 5 -v http://0.0.0.0:3000 >/dev/null; do sleep 1; done
	while ! curl --retry 10 --retry-delay 5 -v http://0.0.0.0:9091 >/dev/null; do sleep 1; done
	
reload-prom:
	curl -X POST http://localhost:9090/-/reload

stop:
	docker-compose down
