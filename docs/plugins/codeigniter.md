# `CodeIgniter` plugin

The `codeigniter` plugin consumes [CodeIgniter](https://codeigniter.com/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `log_path` | `string` | `""`  | Path to CodeIgniter formatted log file |
| `start_at` | `end` | Start reading file from 'beginning' or 'end' |

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: codeigniter
- type: stdout

```

With non-standard log path:

```yaml
pipeline:
- type: codeigniter
  log_path: "/path/to/logs"
- type: stdout

```
