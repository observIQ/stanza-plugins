#!/usr/bin/env bash

# Run this script from the root of the repo to create a configmap
# containing all of your local plugins

set -e

configmap() {
    kubectl delete configmap plugin || true

    kubectl create configmap plugin \
        --from-file plugins/aerospike.yaml \
        --from-file plugins/amazon_eks.yaml \
        --from-file plugins/apache_combined.yaml \
        --from-file plugins/apache_common.yaml \
        --from-file plugins/apache_http.yaml \
        --from-file plugins/aws_cloudwatch.yaml \
        --from-file plugins/azure_aks.yaml \
        --from-file plugins/azure_event_hub.yaml \
        --from-file plugins/azure_log_analytics.yaml \
        --from-file plugins/bindplane_agent.yaml \
        --from-file plugins/cassandra.yaml \
        --from-file plugins/cisco_asa.yaml \
        --from-file plugins/cisco_meraki.yaml \
        --from-file plugins/codeigniter.yaml \
        --from-file plugins/couchbase.yaml \
        --from-file plugins/couchdb.yaml \
        --from-file plugins/csv.yaml \
        --from-file plugins/docker_swarm.yaml \
        --from-file plugins/elasticsearch.yaml \
        --from-file plugins/file.yaml \
        --from-file plugins/hadoop.yaml \
        --from-file plugins/hbase.yaml \
        --from-file plugins/ibm_db2.yaml \
        --from-file plugins/jboss.yaml \
        --from-file plugins/journald.yaml \
        --from-file plugins/json.yaml \
        --from-file plugins/kafka.yaml \
        --from-file plugins/kubernetes_cluster.yaml \
        --from-file plugins/kubernetes_container.yaml \
        --from-file plugins/kubernetes_events.yaml \
        --from-file plugins/kubernetes.yaml \
        --from-file plugins/macos.yaml \
        --from-file plugins/mariadb.yaml \
        --from-file plugins/memcached.yaml \
        --from-file plugins/microsoft_iis.yaml \
        --from-file plugins/mongodb.yaml \
        --from-file plugins/mysql.yaml \
        --from-file plugins/netflow.yaml \
        --from-file plugins/netmotion.yaml \
        --from-file plugins/nginx_ingress.yaml \
        --from-file plugins/nginx.yaml \
        --from-file plugins/observiq_agent.yaml \
        --from-file plugins/openshift.yaml \
        --from-file plugins/oracledb.yaml \
        --from-file plugins/pgbouncer.yaml \
        --from-file plugins/postgresql.yaml \
        --from-file plugins/rabbitmq.yaml \
        --from-file plugins/redis.yaml \
        --from-file plugins/rsyslog.yaml \
        --from-file plugins/sap_hana.yaml \
        --from-file plugins/sflow.yaml \
        --from-file plugins/sqlserver.yaml \
        --from-file plugins/syslogng.yaml \
        --from-file plugins/syslog.yaml \
        --from-file plugins/tail.yaml \
        --from-file plugins/tomcat.yaml \
        --from-file plugins/ubiquiti.yaml \
        --from-file plugins/uwsgi.yaml \
        --from-file plugins/vmware_esxi.yaml \
        --from-file plugins/vmware_vcenter.yaml \
        --from-file plugins/windows_active_directory.yaml \
        --from-file plugins/windows_dhcp.yaml \
        --from-file plugins/windows_event.yaml \
        --from-file plugins/zookeeper.yaml
}

configmap