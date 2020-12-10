# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.26] - Unreleased
### Changed
- Update `windows_dhcp` plugin ([PR122](https://github.com/observIQ/stanza-plugins/pull/122))
  - Set fields `vendor_class_ascii`, `user_Class_hex`, `user_class_ascii`, `relay_agent_info`, and `dns_reg_error` as optional to fix parsing errors.
  - Filter start up log messages at beginning of file.
- Update `mysql` plugin ([PR123](https://github.com/observIQ/stanza-plugins/pull/123))
  - Bump version
- Update `nginx` plugin ([PR](https://github.com/observIQ/stanza-plugins/pull/124))
  - Added supported platforms

## [0.0.25] - 2020-12-07
### Changed
- Update `mysql` plugin ([PR121](https://github.com/observIQ/stanza-plugins/pull/121))
  - Update Regex for `dbuser` and `dbname` fields to allow non letter characters.
  - Update Regex for `ip_address` to allow IPv6 addresses in field.

## [0.0.21] - 2020-11-19
### Changed
- Update `oracledb` plugin ([PR93](https://github.com/observIQ/stanza-plugins/pull/93))
  - Bump version
  
## [0.0.20] - 2020-11-19
### Changed
- Update plugins to add supported_plugins parameter ([PR90](https://github.com/observIQ/stanza-plugins/pull/90))
  - `kubernetes`
  - `kubernetes_cluster`
  - `kubernetes_container`
  - `kubernetes_events`
  - `windows_active_directory`
  - `windows_dhcp`
  - `windows_events`

## [0.0.19] - 2020-11-19
### Added
- Add `bpagent` plugin ([PR81](https://github.com/observIQ/stanza-plugins/pull/81))
### Changed
- Update `tomcat` plugin ([PR89](https://github.com/observIQ/stanza-plugins/pull/89))
  - Further parse catalina parse adding fields `thread` and `tc_source`
- Update `vmware_vcenter` plugin ([PR87](https://github.com/observIQ/stanza-plugins/pull/87))
  - Update timestamp parsing to match version 6.7 format
- Update `oracledb` plugin ([PR86](https://github.com/observIQ/stanza-plugins/pull/86))
  - Add xml parsing support to alert log
  - Fix parsing issues in xml regex
- Update `vmware_vcenter` plugin ([PR85](https://github.com/observIQ/stanza-plugins/pull/85))
  - Update timestamp parsing to match version 6.7 format
- Update `mongodb` plugin ([PR84](https://github.com/observIQ/stanza-plugins/pull/84))
  - Add support for MongoDB 4.4 JSON log format
- Update `aerospike` plugin ([PR83](https://github.com/observIQ/stanza-plugins/pull/83))
  - Filter config context
  - Split `source_location` field to `source_file` and `source_location`

## [0.0.18] - 2020-11-10
### Changed
- Add `kubernetes` plugin back to overwrite old version

## [0.0.17] - 2020-11-10
### Changed
- Plugin parameters are now specified as an ordered array
- Added relevant_if to parameters
- Split `kubernetes` plugin into `kubernete_cluster` and `kubernetes_container`

## [0.0.16] - 2020-10-13
### Changed

- Update `apache_http` plugin ([PR74](https://github.com/observIQ/stanza-plugins/pull/74))
  - Add warn severity mapping.
  - Add trace1-8 severity mapping.
  - Fix trace level log parsing.
- Update `oracledb` plugin ([PR74](https://github.com/observIQ/stanza-plugins/pull/73))
  - Add support for 12.1 alert log timestamp format.
  - Fix parse error with audit log.

## [0.0.15] - 2020-10-08
### Changed

- Added `k8s.cluster.name` to `kubernetes_events` plugin ([PR71](https://github.com/observIQ/stanza-plugins/pull/71))

## [0.0.14] - 2020-10-07
### Changed

- Added `k8s.node.name` to kubernetes plugins ([PR70](https://github.com/observIQ/stanza-plugins/pull/70))
- Added metadata to `kubernetes_event` plugin ([PR70](https://github.com/observIQ/stanza-plugins/pull/70))
- Update `apache_http` Plugin ([PR68](https://github.com/observIQ/stanza-plugins/pull/68))
  - Add parsing of agent field to Access Log
  - Add severity parsing from code field to Access Log

## [0.0.13] - 2020-10-01
### Changed

- Update Kubernetes Plugins ([PR66](https://github.com/observIQ/stanza-plugins/pull/66))
  - `kubernetes`
  - `amazon_eks`
  - `azure_aks`
  - `openshift`
  - `kubernetes_events`

## [0.0.12] - 2020-09-25
### Changed

- Update Tail Plugin ([PR64](https://github.com/observIQ/stanza-plugins/pull/64))
- Apache Http plugin ([PR63](https://github.com/observIQ/stanza-plugins/pull/63))
- Windows Event plugin ([PR62](https://github.com/observIQ/stanza-plugins/pull/62))
- Update Plugins ([PR60](https://github.com/observIQ/stanza-plugins/pull/60))
  - `kafka`
  - `tail`
  - `tomcat`

## [0.0.11] - 2020-09-15
### Added

- Tail Plugin ([PR55](https://github.com/observIQ/stanza-plugins/pull/55))

### Changed

- Update Other Kubernetes Plugins ([PR56](https://github.com/observIQ/stanza-plugins/pull/56))
  - `azure_aks`
  - `amazon_eks`
- Update Nginx Plugin ([PR58](https://github.com/observIQ/stanza-plugins/pull/58))

## [0.0.10] - 2020-09-09
### Change

- Add Defaults to plugins ([PR54](https://github.com/observIQ/stanza-plugins/pull/54))
  - `aerospike`
  - `amazon_eks`
  - `azure_aks`
  - `cisco_asa`
  - `cisco_meraki`
  - `couchbase`
  - `couchdb`
  - `dcoker_swarm`
  - `elasticsearch`
  - `gitlab`
  - `hadoop`
  - `hbase`
  - `jboss`
  - `memchached`
  - `microsoft_iis`
  - `openshift`
  - `oracledb`
  - `pgbouncer`
  - `redis`
  - `sap_hana`
  - `sqlserver`
  - `syslog`
  - `vmware_esxi`
  - `vmware_vcenter`
  - `windows_active_directory`
  - `windows_dhcp`
  - `zookeeper`
- Add Defaults to plugins ([PR52](https://github.com/observIQ/stanza-plugins/pull/52))
  - `cassandra`
  - `ibm_db2`
  - `kafka`
  - `mongodb`
  - `mysql`
  - `nginx`
  - `oracledb`
  - `postgresql`
  - `tomcat`
- Update Defaults ([PR53](https://github.com/observIQ/stanza-plugins/pull/53))
  - `cisco_asa`
  - `cisco_meraki`
  - `syslog`
  - `vmware_esxi`
  - `vmware_vcenter`

## [0.0.9] - 2020-09-01
### Changed

- Kubernetes plugin ([PR51](https://github.com/observIQ/stanza-plugins/pull/51))

## [0.0.8] - 2020-09-01
### Changed

- Kubernetes plugin ([PR50](https://github.com/observIQ/stanza-plugins/pull/50))
- Kubernetes plugin ([PR49](https://github.com/observIQ/stanza-plugins/pull/49))

### Added

- Windows Event plugin ([PR48](https://github.com/observIQ/stanza-plugins/pull/48))
- Kubernetes Event plugin ([PR47](https://github.com/observIQ/stanza-plugins/pull/47))

## [0.0.7] - 2020-08-24
### Changed

- Project name changed to `stanza-plugins`

## [0.0.6] - 2020-08-19
### Added

- Apache HTTP plugin
- `plugin_id` label added to all input operators

## [0.0.5] - 2020-08-17
### Added

- Elasticsearch plugin ([PR16](https://github.com/observIQ/stanza-plugins/pull/16))
- Jboss plugin ([PR17](https://github.com/observIQ/stanza-plugins/pull/17))
- Gitlab plugin ([PR18](https://github.com/observIQ/stanza-plugins/pull/18))
- Aerospike plugin ([PR19](https://github.com/observIQ/stanza-plugins/pull/19))
- Memcached plugin ([PR20](https://github.com/observIQ/stanza-plugins/pull/20))
- Syslog plugin ([PR21](https://github.com/observIQ/stanza-plugins/pull/21))
- Redis plugin ([PR22](https://github.com/observIQ/stanza-plugins/pull/22))
- Pgbouncer plugin ([PR23](https://github.com/observIQ/stanza-plugins/pull/23))
- Rabbitmq plugin ([PR24](https://github.com/observIQ/stanza-plugins/pull/24))
- Couchbase plugin ([PR25](https://github.com/observIQ/stanza-plugins/pull/25))
- Windows DHCP plugin ([PR27](https://github.com/observIQ/stanza-plugins/pull/27))
- Active Directory plugin ([PR28](https://github.com/observIQ/stanza-plugins/pull/28))
- SQL Server plugin ([PR29](https://github.com/observIQ/stanza-plugins/pull/29))
- Couchdb plugin ([PR30](https://github.com/observIQ/stanza-plugins/pull/30))
- Docker Swarm plugin ([PR31](https://github.com/observIQ/stanza-plugins/pull/31))
- Apache HBase plugin ([PR32](https://github.com/observIQ/stanza-plugins/pull/32))
- VMware vCenter plugin ([PR33](https://github.com/observIQ/stanza-plugins/pull/33))
- Apache Zookeper plugin ([PR34](https://github.com/observIQ/stanza-plugins/pull/34))
- Cisco ASA plugin ([PR35](https://github.com/observIQ/stanza-plugins/pull/35))
- SAP Hana plugin ([PR36](https://github.com/observIQ/stanza-plugins/pull/36))
- Apache Hadoop plugin ([PR37](https://github.com/observIQ/stanza-plugins/pull/37))
- VMware ESXi plugin ([PR38](https://github.com/observIQ/stanza-plugins/pull/38))
- Cisco Meraki plugin ([PR39](https://github.com/observIQ/stanza-plugins/pull/39))
- Microsoft IIS plugin ([PR40](https://github.com/observIQ/stanza-plugins/pull/40))
- Amazon EKS plugin ([PR41](https://github.com/observIQ/stanza-plugins/pull/41))
- Azure AKS plugin ([PR42](https://github.com/observIQ/stanza-plugins/pull/42))

### Changed

- MySQL plugin ([PR26](https://github.com/observIQ/stanza-plugins/pull/26))

## [0.0.3] - 2020-08-03
### Added

- Apache Kafka plugin ([PR12](https://github.com/observIQ/stanza-plugins/pull/12))
- NGINX plugin ([PR10](https://github.com/observIQ/stanza-plugins/pull/10))
- Apache Cassandra plugin ([PR8](https://github.com/observIQ/stanza-plugins/pull/8))

### Changed

- Kubernetes plugin ([PR11](https://github.com/observIQ/stanza-plugins/pull/11))

## [0.0.2] - 2020-07-28
### Added

- OpenShift plugin ([PR4](https://github.com/observIQ/stanza-plugins/pull/4))
- PostgreSQL plugin ([PR5](https://github.com/observIQ/stanza-plugins/pull/5))

### Changed

- Enhanced parameter metadata ([PR9](https://github.com/observIQ/stanza-plugins/pull/9))

## [0.0.1] - 2020-07-21
### Added

- Kubelet message parsing to kubernetes.yaml ([PR3](https://github.com/observIQ/stanza-plugins/pull/3))
