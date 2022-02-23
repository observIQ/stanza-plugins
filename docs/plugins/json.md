# `JSON` plugin

The `json` plugin consumes [JSON](https://www.json.org/json-en.html) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `source` | `enum` | `"file"` | Use this field to specify where your logs are coming from. When choosing the 'file' option, the agent reads in logs from the log paths specified below.  When choosing the 'Kubernetes' options, the agent reads logs from /var/log/containers based on the Pod and Container specified below. |
| `cluster_name` | `string` | `""` | Cluster Name to be added to a resource label | 
| `pod_name` | `string` | `""` | The pod name (without the unique identifier on the end) | 
| `container_name` | `string` | `"*"` | The container name | 
| `file_log_path` | `strings` | `[]` | Specify a single path or multiple paths to read one or many files. You may also use a wildcard (*) to read multiple files within a directory. | 
| `exclude_file_log_path` | `strings` | `[]` | Specify a single path or multiple paths to exclude one or many files from being read. You may also use a wildcard (*) to exclude multiple files from being read within a directory. | 
| `encoding` | `enumb` | `"utf-8"` | Specify the encoding of the file(s) being read. In most cases, you can leave the default option selected. | 
| `log_type` | `string` | `"json"` | Adds the specified 'Type' as a label to each log message. | 
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: json
- type: stdout

```

With non-standard file log path:

```yaml
pipeline:
- type: json
  file_log_path: "/path/to/logs"
- type: stdout

```
