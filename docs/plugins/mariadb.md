# `MariaDB` plugin

The `mariadb` plugin consumes [MariaDB](https://mariadb.org/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `enable_general_log` | `bool` | `true` |  Enable to collect MariaDB general logs. |
| `general_log_path` | `string` | `"/var/log/mariadb/general.log"` | Path to general log file. | 
| `enable_slow_log` | `bool` | `true` | Enable to collect MariaDB slow query logs. |
| `slow_query_log_path` | `string` | `"/var/log/mariadb/slow.log"` | Path to slow query log file. | 
| `enable_error_log` | `bool` | `true` |  Enable to collect MariaDB error logs. |
| `error_log_path` | `string` | `"/var/log/mariadb/error.log"` | Path to MariaDB error log file. | 
| `enable_mariadb_audit_log` | `bool` | `false` |  Enable to collect MariaDB audit logs provided by MariaDB Audit plugin. |
| `mariadb_audit_log_path` | `string` | `"/var/log/mariadb/audit.log"` | Path to audit log file created by MariaDB plugin | 
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: mariadb
- type: stdout

```

With audit logs enabled:

```yaml
pipeline:
- type: mariadb
  enable_mariadb_audit_log: true
- type: stdout

```
