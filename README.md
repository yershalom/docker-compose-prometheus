# docker-compose-prometheus
> Test repo for prometheus stack with some examples

## Services

* Prometheus
* Grafana
* Alertmanager
* Pushgateway
* cadvisor
* node-exporter
* Elasticsearch
* elasticsearch_exporter

## Running

* `make up` will start the whole stack.
* `make test` will test.
* `make reload-prom` will reload prometheus after `prometheus.yml` changes.
