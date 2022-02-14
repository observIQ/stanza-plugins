# `cassandra` plugin

The `cassandra` plugin consumes [Apache Cassandra](https://cassandra.apache.org/_/index.html) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Default | Description |
| --- | --- | --- |
| `enable_system_logs` | `true` | Enable collection of Cassandra system logs |
| `system_log_path` | `"/var/log/cassandra/cassandra.log"` | Path to the Apache Cassandra system log file. |
| `enable_debug_logs` | `true`  | Enable collection of Cassandra debug logs |
| `debug_log_path` | `"/var/log/cassandra/debug.log"` | Path to the Apache Cassandra debug log file. |
| `enable_gc_logs` | `true` | Enable collection of Cassandra garbage collection logs |
| `gc_log_path` | `"/var/log/cassandra/gc.log"` | Path to the Apache Cassandra garbage collection log file. |
| `start_at` | `end` | Start reading file from 'beginning' or 'end' |

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: cassandra
- type: stdout

```

With non-standard system log path:

```yaml
pipeline:
- type: cassandra
  system_log_path: "/path/to/logs"
- type: stdout

```
