# `Openshift` plugin

The `openshift` plugin consumes [Openshift](https://docs.openshift.com/) log entries from the local filesystem and outputs parsed entries. 

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `journald_log_path` | `string` | `"/var/log/journal"` | The directory where the journald logs are located. Defaults to '/var/log/journal'. |
| `start_at` | `enum` | `"end"` | "Start reading file from 'beginning' or 'end'" | 
| `cluster_name` | `string` | `"/var/log/journal"` | Cluster Name to be added to a resource label. |
| `enable_container_logs` | `bool` | `true` | Enable collection of container logs. |
| `enable_docker_logs` | `bool` | `true` | Enable collection of the Docker Daemon logs. |
| `enable_openshift_logs` | `bool` | `true` | Enable collection of Openshift unit logs. |
| `enable_metadata` | `bool` | `false` | [Attach metadata to entries.](https://github.com/observIQ/stanza/blob/master/docs/operators/k8s_metadata_decorator.md) |
| `poll_interval` | `string` | `"200ms"` | How often to poll journald. |


## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: openshift
- type: stdout

```

With a non-standard log path and poll interval:

```yaml
pipeline:
- type: openshift
  journald_log_path: "/path/to/logs"
  poll_interval: "100ms"
- type: stdout

```
