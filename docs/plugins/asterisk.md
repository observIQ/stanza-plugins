# `Asterisk` plugin

The `asterisk` plugin consumes [Asterisk](https://www.asterisk.org/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- | --- | --- |
| `file_log_path` | `string` | `''` | Specify a single path or multiple paths to read one or many files. You may also use a wildcard (*) to read multiple files within a directory. |
| `exclude_file_log_path` | `strings` | `[]` | Specify a single path or multiple paths to exclude one or many files from being read. You may also use a wildcard (*) to exclude multiple files from being read within a directory. |
| `encoding` | `enum` | `utf-8` | Specify the encoding of the file(s) being read. In most cases, you can leave the default option selected. |
| `timestamp_format` | `enum` | `ISO 8601` | Specify the timestamp format in the log file(s) being read. In most cases, you can leave the default option selected. |
| `start_at` | `beginning` | Start reading file from 'beginning' or 'end' |

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: asterisk
- type: stdout

```

With encoding specified:

```yaml
pipeline:
- type: asterisk
  encoding: ascii 
- type: stdout
