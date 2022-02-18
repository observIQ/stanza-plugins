# `IBM DB2` plugin

The `ibm_db2` plugin consumes [IBM DB2](https://www.ibm.com/analytics/db2) log entries from the local filesystem and outputs parsed entries. 

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `log_path` | `string` | `"/home/db2inst1/sqllib/db2dump/db2diag.log"` | Path to the log file |
| `start_at` | `enum` | `"end"` | "Start reading file from 'beginning' or 'end'" | 



## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: ibm_db2
- type: stdout

```

With a non-standard log path:

```yaml
pipeline:
- type: ibm_db2
  log_path: "/path/to/logs"
- type: stdout

```
