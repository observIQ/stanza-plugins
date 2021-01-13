# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
## [0.0.36] - Unreleased
### Changed
- Update `bindplane_agent` plugin ([PR176](https://github.com/observIQ/stanza-plugins/pull/176))
  - Add log_type_router to add log_type `bindplane.agent.manager` and `bindplane.agent.launcher`
  - Add metadata to add log_type `bindplane.agent.logagent`
- Update `kubernetes_container` plugin ([PR180](https://github.com/observIQ/stanza-plugins/pull/180))
  - Change move from `log` field back to `$record`
- Update 'kubernetes_events' plugin ([PR181](https://github.com/observIQ/stanza-plugins/pull/181/files))
  - Add RELOAD, Sync, FailedBinding severity mappings
## [0.0.35] - 2021-01-11
### Changed
- Update `nginx_ingress` plugin 
  - Update observiq log format to be JSON format ([PR173](https://github.com/observIQ/stanza-plugins/pull/173))
  - Update error and access `log_type` values to `nginx.ingress.error` and `nginx.ingress.access` ([PR166](https://github.com/observIQ/stanza-plugins/pull/166))
- Update `pgbouncer` plugin ([PR172](https://github.com/observIQ/stanza-plugins/pull/172))
  - Remove `*` from `file_path` parameter defaults
- Update `aerospike` plugin ([PR171](https://github.com/observIQ/stanza-plugins/pull/171))
  - Remove `enable_general_log` parameter
  - Change log_type to aerospike
- Update `couchbase` plugin ([PR170](https://github.com/observIQ/stanza-plugins/pull/170))
  - Rename name `http_status_code` field to `status`
- Update `hbase` plugin ([PR169](https://github.com/observIQ/stanza-plugins/pull/169))
  - Remove `preserve_to` parameter from severity
  - Add severity parser to internal access and access logs
- Update `rabbitmq` plugin ([PR168](https://github.com/observIQ/stanza-plugins/pull/168))  
  - Remove `preserve_to` parameter from severity
- Update `redis` plugin ([PR167](https://github.com/observIQ/stanza-plugins/pull/167))  
  - Remove `preserve_to` parameter from severity
- Update `nginx` plugin ([PR165](https://github.com/observIQ/stanza-plugins/pull/165))
  - Update default log format to remove http_x_forwarded_for field
  - Update observiq log format to use json formatting and parsing
- Update kubernetes_cluster plugin ([PR164](https://github.com/observIQ/stanza-plugins/pull/164))
  - Remove `container_log_path` parameter and hard code path `/var/log/containers/`
  - Move log field to message field
- Update `kubernetes_container` plugin ([PR163](https://github.com/observIQ/stanza-plugins/pull/163))
  - Add severity parser
- Update `kubernetes_events` plugin ([PR162](https://github.com/observIQ/stanza-plugins/pull/162))
  - Add missing INFO level cluster events
- Update `dockerswarm` plugin ([PR161](https://github.com/observIQ/stanza-plugins/pull/161))
  - Update docker_swarm_parser parser timestamp layout to use space padded day. 
  - Remove the severity `preserve_to` parameter from dockerd_parser and containerd_parser
  - Change severity name on containerd_parser to containerd_severity
  - Add pid field
## [0.0.34] - 2021-01-07
### Changed
- Update `kubernetes_cluster` plugin ([PR160](https://github.com/observIQ/stanza-plugins/pull/160))
  - Update `title` parameter value to Kubernetes Node
  - Change default log_type to k8s.node
- Update `kubernetes_container` plugin ([PR159](https://github.com/observIQ/stanza-plugins/pull/159))
  - Add log_type k8s.container to labels
  - Exclude kube* pods
## [0.0.33] - 2021-01-07
### Changed
- Update `nginx` plugin ([PR158](https://github.com/observIQ/stanza-plugins/pull/158))
  - Add default parameter to `log_format` parameter
- Update `nginx_ingress` plugin ([PR158](https://github.com/observIQ/stanza-plugins/pull/158))
  - Update `nginx_ingress` with source parameter
  - Add default parameter to `log_format` parameter
- Update `vmware_esxi` plugin ([PR157](https://github.com/observIQ/stanza-plugins/pull/157))
  - Add severity parser to parse priority field.
- Update `aerospike` plugin ([PR156](https://github.com/observIQ/stanza-plugins/pull/156))  
  - Update regex to handle `FAILED ASSERTION` severity.
  - Remove `preserve_to` parameter
- Update `sap_hana` plugin ([PR155](https://github.com/observIQ/stanza-plugins/pull/155))
  - Remove `file_path` and `preserve_to` parameter
  - Add `file_name` and `logs_directory` parameter
  - Exclude `nameserver_history*.trc`, `nameserver*loads*.trc`, `nameserver*unloads*.trc`, and `nameserver*executed_statements*.trc` files

## [0.0.32] - 2021-01-04
### Changed
- Fixed exclude for `kubernetes_container` plugin ([PR152](https://github.com/observIQ/stanza-plugins/pull/152))
- Update `jboss` plugin ([PR151](https://github.com/observIQ/stanza-plugins/pull/151))
  - Remove `jboss_severity` field
- Remove `vmware_esxi` plugin ([PR149](https://github.com/observIQ/stanza-plugins/pull/149))
  - Change order of esxi_parser_3 and esxi_parser_4
- Update `couchbase` plugin ([PR147](https://github.com/observIQ/stanza-plugins/pull/147))
  - Update Debug, Error, and Info log regex to add missing `host` field
  - Update Babysitter log regex to add missing `source` field
- Update `openshift` plugin ([PR151](https://github.com/observIQ/stanza-plugins/pull/151))
  - Use `_COMM` field for identifying container logs instead of `_SYSTEMD_UNIT` field

## [0.0.31] - 2020-12-30
### Removed
- Remove `bpagent` plugin ([PR144](https://github.com/observIQ/stanza-plugins/pull/144))
  - Split plugin into two plugins. One plugin for BindPlane and one plugin for observIQ.
### Added
- Add `observiq_agent` plugin ([PR144](https://github.com/observIQ/stanza-plugins/pull/144))
  - Add `log_type` parameter to labels
- Add `bindplane_agent` plugin ([PR144](https://github.com/observIQ/stanza-plugins/pull/144))
  - Add `log_type` parameter to labels
- Add `nginx_ingress` plugin ([PR137](https://github.com/observIQ/stanza-plugins/pull/137))
  - Move NGINX Ingress out of NGINX into its own plugin.
  - Add new regex pattern to parse access logs based on a defined spec.
  - Add cluster_name parameter.
### Changed
- Update `postgresql` plugin ([PR146](https://github.com/observIQ/stanza-plugins/pull/146))
  - Update regex to change field `process_start_time` to grab only process start time.
- Update `cassandra` plugin ([PR145](https://github.com/observIQ/stanza-plugins/pull/145))
  - Add line start character to multiline line_start_pattern for gc log.
- Update `postgresql` plugin ([PR143](https://github.com/observIQ/stanza-plugins/pull/143))
  - Parse logs more deeply to grad more data fields
  - Added fields depending on the message. All fields are present, but some log messages will not have data for field.
    - `duration`
    - `error`
    - `parameters`
    - `statement`
- Update `memcached` plugin ([PR142](https://github.com/observIQ/stanza-plugins/pull/142))
  - Add `enable_memcached_journald_log_path` parameter
  - Remove id from `journald_input` to fix id clash within Stanza
- Update `nginx` plugin ([PR138](https://github.com/observIQ/stanza-plugins/pull/138))
  - Move NGINX Ingress out of NGINX into its own plugin.
  - Add parameter `log_format` to allow choice between default combined and observiq log format.
  - Add new regex pattern to parse access logs based on a defined observiq log format.
  - Make `pod_name` parameter required and remove default

## [0.0.30] - 2020-12-23
### Changed
- Update `windows_dhcp` plugin ([PR141](https://github.com/observIQ/stanza-plugins/pull/141))
  - Add `fingerprint_size` parameter to look past boilerplate preamble
- Update `oracledb` plugin ([PR140](https://github.com/observIQ/stanza-plugins/pull/140))
  - Fix typo in timestamp parser layout

## [0.0.29] - 2020-12-21
### Changed
- Update `vmware_esxi` plugin ([PR139](https://github.com/observIQ/stanza-plugins/pull/139))
  - Update router and regex to support more time formats
- Update `kubernetes_container` plugin ([PR136](https://github.com/observIQ/stanza-plugins/pull/136))
  - Specified output for the plugin so it can be directed.
- Update `apache_http` plugin ([PR135](https://github.com/observIQ/stanza-plugins/pull/135))
  - Updated regex group names to be more descriptive and more inline with docs and nginx.
  - Removed agent parsing.

## [0.0.28] - 2020-12-15
### Changed
- Update `nginx` plugin ([PR133](https://github.com/observIQ/stanza-plugins/pull/133))
  - Add labels `log_type` and `plugin_id` fields when input is kubernetes source
  - Add parser for ingress controller logs
  - Fix parsing error with 503 status codes

## [0.0.27] - 2020-12-11
### Changed
- Update `jboss` plugin ([PR130](https://github.com/observIQ/stanza-plugins/pull/130))
  - Add fields `category` add `thread` to regex
- Update `hbase` plugin ([PR129](https://github.com/observIQ/stanza-plugins/pull/129))
  - Change `thread` field regex to capture all characters
- Update `kubernetes_cluster` plugin ([PR131]https://github.com/observIQ/stanza-plugins/pull/131))
  - Remove reference to cluster_name_restructurer.

## [0.0.26] - 2020-12-10
### Changed
- Update `nginx` plugin ([PR128](https://github.com/observIQ/stanza-plugins/pull/128))
  - Add labels `log_type` and `plugin_id` when source is Kubernetes.
- Update `hbase` plugin ([PR127](https://github.com/observIQ/stanza-plugins/pull/127))
  - Remove routers in favor of `if:` parameter in regexs
  - Add `thread` and `hbase_source` fields to stardard_parsers for each log type.
- Update `couchdb` plugin ([PR126](https://github.com/observIQ/stanza-plugins/pull/126))
  - Allow `-` character in regex parser. Replaced `\w+` with `[\w-]+`
  - Made `hostname` and `port` optional as they are not always present in the logs.
- Update `oracledb` plugin ([PR125](https://github.com/observIQ/stanza-plugins/pull/125))
  - Oracle audit log timestamp does not use leading zero on hour
- Update `nginx` plugin ([PR124](https://github.com/observIQ/stanza-plugins/pull/124))
  - Specified supported platforms
- Update `mysql` plugin ([PR123](https://github.com/observIQ/stanza-plugins/pull/123))
  - Bump version
- Update `windows_dhcp` plugin ([PR122](https://github.com/observIQ/stanza-plugins/pull/122))
  - Set fields `vendor_class_ascii`, `user_Class_hex`, `user_class_ascii`, `relay_agent_info`, and `dns_reg_error` as optional to fix parsing errors.
  - Filter start up log messages at beginning of file.

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
