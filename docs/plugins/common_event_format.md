# `Common Event Format` plugin

The `common_event_format` plugin consumes [Common Event Format](https://www.microfocus.com/en-us/cyberres/certifications-standards#section3) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `file_log_path` | `strings` | `[]`  | Specify a single path or multiple paths to read one or many files. You may also use a wildcard (*) to read multiple files within a directory. |
| `exclude_file_log_path` | `strings` | `[]`  | Specify a single path or multiple paths to exclude one or many files from being read. You may also use a wildcard (*) to exclude multiple files from being read within a directory. |
| `log_type` | `string` | `"cef"`  | Adds the specified 'Type' as a label to each log message. |
| `location` | `enum` | `"UTC"`  | The geographic location (timezone) to use when parsing logs that contain a timestamp |
| `start_at` |   | `end` | Start reading file from 'beginning' or 'end' |

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: common_event_format
- type: stdout

```

With a location other than UTC:

```yaml
pipeline:
- type: common_event_format
  location: "Africa/Abidjan"
- type: stdout

```
