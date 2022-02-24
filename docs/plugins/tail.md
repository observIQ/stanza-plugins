# `Tail` plugin

The `tail` plugin consumes log files from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- | --- | --- |
| `file_log_path` | `strings` | `[]` | An array of file log path glob patterns. |
| `exclude_file_log_path` | `strings` |  `[]` | An array of file log path glob patterns to be excluded. |
| `enable_multiline` | `bool` | `false` | Enable to parse Multiline Log Files |
| `multiline_line_start_pattern` | `string` | `''` | A Regex pattern that matches the start of a multiline log entry in the log file. |
| `encoding` | `enum ` | `utf-8` | Specify the encoding of the file(s) being read. In most cases, you can leave the default option selected. |
| `parse_format` | `none ` | `utf-8` | The log format to parse. |
| `log_type` | `string` | `tail` | Adds the specified 'Type' as a label to each log message. |
| `start_at` | `enum` | `beginning` | Start reading file from 'beginning' or 'end' |

## Example usage

### Simple file input

Stanza Pipeline
```yaml
pipeline:
- type: tail
  file_log_path:
    - "/test.log"
- type: stdout

```

<table>
<tr><td> `./test.log` </td> <td> Output records </td></tr>
<tr>
<td>

```
log1
log2
log3
```

</td>
<td>

```json
{
  "message": "log1"
},
{
  "message": "log2"
},
{
  "message": "log3"
}
```

</td>
</tr>
</table>

### Multiline

Configuration:
```yaml
pipeline:
- type: tail
  file_log_path: "/test.log"
  enable_multiline: true
  multiline_line_start_pattern: 'START '
- type: stdout
```

<table>
<tr><td> `./test.log` </td> <td> Output records </td></tr>
<tr>
<td>

```
START log1
log2
START log3
log4
```

</td>
<td>

```json
{
  "message": "START log1\nlog2\n"
},
{
  "message": "START log3\nlog4\n"
}
```

</td>
</tr>
</table>
