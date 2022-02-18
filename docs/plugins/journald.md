# `Journald` plugin

The `journald` plugin consumes [Journald](https://en.wikipedia.org/wiki/Systemd#journald) log entries from the local filesystem and outputs parsed entries. 

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `enable_journald_log_path` | `bool` | `false` | Enable to define custom Journald Log path. If not enabled it will read from "/run/journal" or "/var/log/journal" by default. |
| `journald_log_path` | `string` | `"/var/log/journal"` | Custom Journald Log path. |
| `start_at` | `enum` | `"end"` | "Start reading file from 'beginning' or 'end'" | 
| `log_type` | `string` | `"journald"` | Adds label log_type to identify journald source. |
| `poll_interval` | `string` | `"200ms"` | How often to poll journald. |




## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: journald
- type: stdout

```

With a non-standard log path and poll interval:

```yaml
pipeline:
- type: journald
  journald_log_path: "/path/to/logs"
  poll_interval: "100ms"
- type: stdout

```
