# `Microsoft SQL Server` plugin

The `sqlserver` plugin consumes [Microsoft SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `poll_interval` | `string` | `"1s"` | The interval at which a channel is checked for new log entries |
| `max_reads` | `int` | `100` | The maximum number of events read into memory at one time | 
| `listen_ip` | `string` | `"0.0.0.0"` | A UDP ip address of the form `<ip>` | 
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 


## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: sqlserver
- type: stdout

```

With a non-standard poll interval:

```yaml
pipeline:
- type: sqlserver
  poll_interval: "2s"
- type: stdout

```
