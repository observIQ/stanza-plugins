# `PgBouncer` plugin

The `pgbouncer` plugin consumes [PgBouncer](https://www.pgbouncer.org/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `file_path` | `string` | `"/var/log/pgbouncer/pgbouncer.log"` | The absolute path to the PgBouncer logs. | 
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: pgbouncer
- type: stdout

```

With non-standard log path:

```yaml
pipeline:
- type: pgbouncer
  file_path: "/path/to/logs.log"
- type: stdout
```
