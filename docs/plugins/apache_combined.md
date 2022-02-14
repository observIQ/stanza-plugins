# `apache_combined` plugin

The `apache_combined` plugin consumes [Apache Combined](https://httpd.apache.org/docs/2.4/logs.html) log format entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Default | Description |
| --- | --- | --- |
| `log_path` | `"/var/log/apache_combined.log"` | Path to apache combined formatted log file |
| `start_at` | `end` | Start reading file from 'beginning' or 'end' |

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: apache_combined
- type: stdout

```

With non-standard log paths:

```yaml
pipeline:
- type: apache_combined
  log_path: "/path/to/logs"
- type: stdout

```
