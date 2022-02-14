# `mongodb` plugin

The `mongodb` plugin consumes [MongoDB](https://www.mongodb.com/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Default | Description |
| --- | --- | --- |
| `source` | `file` | Use this field to specify where your logs are coming from. When choosing the 'file' option, the agent reads in logs from the log paths specified below.  When choosing the 'Kubernetes' options, the agent reads logs from /var/log/containers based on the Pod and Container specified below. |
| `cluster_name` | `""`  | Cluster Name to be added to a resource label |
| `pod_name` | `mongodb` | PThe pod name (without the unique identifier on the end) |
| `container_name` | `"*"` | The container name of the Mongodb container |
| `log_path` | `"/var/log/mongodb/mongodb.log*"` | The path of the log file |
| `start_at` | `end` | Start reading file from 'beginning' or 'end' |

## Example usage

### Configuration

Using default file log path:

```yaml
pipeline:
- type: mongodb
- type: stdout

```

Using Kubernetes:

```yaml
pipeline:
- type: mongodb
  source: kubernetes
  cluster_name: "mogodb_cluster"
  pod_name: mongodb
  container_name: "*"
- type: stdout

```
