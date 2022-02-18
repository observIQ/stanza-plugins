# `CSV` plugin

The `csv` plugin consumes a [CSV](https://en.wikipedia.org/wiki/Comma-separated_values) file from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `file_log_path` | `strings` | `[]`  | Specify a single path or multiple paths to read one or many files. You may also use a wildcard (*) to read multiple files within a directory. |
| `exclude_file_log_path` | `strings` | `[]`  | Specify a single path or multiple paths to exclude one or many files from being read. You may also use a wildcard (*) to exclude multiple files from being read within a directory. |
| `header` | `string` | `""`  | Comma Separated header string to be used as keys. |
| `encoding` | `enum` | `"utf-8"`  | Specify the encoding of the file(s) being read. In most cases, you can leave the default option selected. |
| `log_type` | `string` | `"csv"`  | Adds the specified 'Type' as a label to each log message. |
| `start_at` |   | `end` | Start reading file from 'beginning' or 'end' |

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: csv
- type: stdout

```

With a non-standard log path:

```yaml
pipeline:
- type: csv
  file_log_path: "/path/to/logs"
- type: stdout

```
