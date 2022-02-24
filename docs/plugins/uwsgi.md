# `uWSGI` plugin

The `uwsgi` plugin consumes [uWSGI](https://uwsgi-docs.readthedocs.io/en/latest/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `log_format` | `enum` | `default` | When choosing the 'default' option, the agent will expect and parse logs in a format that matches the default logging configuration. When choosing the 'observIQ' option, the agent will expect and parse logs in an optimized JSON format that adheres to the observIQ specification, requiring an update to the logging config. See the uWSGIr source page for more information. |
| `uwsgi_log_path` | `string` | `""` | Path to uWSGI formatted log file | 
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: uwsgi
- type: stdout

```

With a non-standard log path:

```yaml
pipeline:
- type: uwsgi
  uwsgi_log_path: "path/to/logs/file.log" #should this be to the folder of file?
- type: stdout

```
