# `apache_common` plugin

The `apache_common` plugin consumes [Apache Common](https://httpd.apache.org/docs/2.4/logs.html) log format entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Default | Description |
| --- | --- | --- |
| `log_path` | `"/var/log/apache2/access.log"` | Path to apache common formatted log file |
| `start_at` | `end` | Start reading file from 'beginning' or 'end' |

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: apache_common
- type: stdout

```

With non-standard log paths:

```yaml
pipeline:
- type: apache_common
  log_path: "/path/to/logs"
- type: stdout

```
