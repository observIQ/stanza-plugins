# `postgresql` plugin

The `postgresql` plugin consumes [PostgreSQL](https://www.postgresql.org/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Default | Description |
| --- | --- | --- |
| `postgresql_log_path` | `"/var/lib/pgsql/*/data/pg_log/postgresql-*.log"` | Path to the PostgreSQL log file |
| `start_at` | `end` | Start reading file from 'beginning' or 'end' |

## Example usage

### Configuration

Using default log path:

```yaml
pipeline:
- type: postgresql
- type: stdout

```

With non-standard log path:

```yaml
pipeline:
- type: postgresql
  postgresql_log_path: "/path/to/logs"
- type: stdout

```
