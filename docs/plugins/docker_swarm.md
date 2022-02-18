# `Docker Swarm` plugin

The `docker_swarm` plugin consumes [Docker Swarm](https://docs.docker.com/engine/swarm/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `message_log_path` | `string` | `"/var/log/messages/*.log"`  | The absolute path to the Docker Swarm message logs |
| `start_at` |   | `end` | Start reading file from 'beginning' or 'end' |

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: docker_swarm
- type: stdout

```

With a non-standard log path:

```yaml
pipeline:
- type: docker_swarm
  message_log_path: "/path/to/logs"
- type: stdout

```
