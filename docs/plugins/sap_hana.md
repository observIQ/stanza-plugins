# `SAP HANA` plugin

The `sap_hana` plugin consumes [SAP HANA](https://www.sap.com/products/hana.html) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `logs_directory` | `string` | `"/usr/sap/*/HDB*/*/trace"` | The directory to the SAP HANA trace logs. No trailing slash should be included. | 
| `file_name` | `string` | `"*.trc"` | The file name of the SAP HANA trace log. This can be a glob pattern. Use "*.trc" to get all files with file extension of "trc". The files nameserver_history*.trc, nameserver*loads*.trc, nameserver*unloads*.trc, and nameserver*executed_staments*.trc are excluded from the logs directory and will not be parsed.. | 
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: sap_hana
- type: stdout

```

With a non-standard logs directory:

```yaml
pipeline:
- type: sap_hana
  logs_directory: "/path/to/logs"
- type: stdout
