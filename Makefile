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
	curl --retry 10 --retry-delay 5 -v -s http://0.0.0.0:9090
	curl --retry 10 --retry-delay 5 -v -s http://0.0.0.0:9091
	curl --retry 10 --retry-delay 5 -v -s http://0.0.0.0:9093
	curl --retry 10 --retry-delay 5 -v -s http://0.0.0.0:3000

reload-prom:
	curl -X POST http://localhost:9090/-/reload

stop:
	docker-compose down
