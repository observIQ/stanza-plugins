# stanza-plugins

stanza-plugins contains plugins for the [Stanza Log Agent](https://github.com/observIQ/stanza)

## Release Process

All plugins in this repository are released together in a single operation.

Maintainers can create a release using the GitHub UI by creating a release that adheres to Golang's [semver](https://godoc.org/github.com/rogpeppe/go-internal/semver) format. (`v1.2.3`)

## Status

| Plugin               | Status                                                                                                                                                                                                   |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Aerospike            | [![aerospike](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_aerospike.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_aerospike.yml)           |
| Apache Combined      | [![apache_combined](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_apache_combined.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_apache_combined.yml) |
| Apache Common        | [![apache_common](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_apache_common.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_apache_common.yml) |
| Apache HTTP          | [![apache_http](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_apache_http.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_apache_http.yml) |
| Cassandra            | [![cassandra](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_cassandra.yaml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_cassandra.yaml) |
| Code Igniter         | [![codeigniter](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_codeigniter.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_codeigniter.yml) |
| Common Event Format  | [![common_event_format](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_common_event_format.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_common_event_format.yml) |
| CouchDB              | [![couchdb](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_couchdb.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_couchdb.yml) |
| Docker Swarm         | [![docker_swarm](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_docker_swarm.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_docker_swarm.yml) |
| Elasticsearch        | [![elasticsearch](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_elasticsearch.yaml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_elasticsearch.yaml) |
| HAProxy              | [![haproxy](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_haproxy.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_haproxy.yml) |
| Hbase              | [![hbase](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_hbase.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_hbase.yml) |
| Kubernetes Container | [![kubernetes_container](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_kubernetes_container.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_kubernetes_container.yml) |
| Kafka                | [![kafka](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_kafka.yaml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_kafka.yaml) |
| Jboss                | [![jboss](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_jboss.yaml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_jboss.yaml) |
| IBM DB2            | [![ibm_db2](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_ibm_db2.yaml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_ibm_db2.yaml) |
| Nginx                | [![nginx](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_nginx.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_nginx.yml) |
| Mariadb              | [![mariadb](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_mariadb.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_mariadb.yml) |
| Microsoft IIS        | [![microsoft_iis](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_microsoft_iis.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_microsoft_iis.yml) |
| Mongodb              | [![mongodb](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_mongodb.yaml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_mongodb.yaml) |
| Mysql                | [![mysql](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_mysql.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_mysql.yml) |
| Oracle Database      | [![oracledb](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_oracledb.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_oracledb.yml) |
| Pgbouncer            | [![pgbouncer](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_pgbouncer.yaml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_pgbouncer.yaml) |
| Postgresql           | [![postgresql](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_postgresql.yaml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_postgresql.yaml) |
| Tomcat               | [![tomcat](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_tomcat.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_tomcat.yml) |
| Uwsgi               | [![uwsgi](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_uwsgi.yml/badge.svg)](https://github.com/observIQ/stanza-plugins/actions/workflows/plugin_uwsgi.yml) |
