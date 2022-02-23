# `Ruby on Rails` plugin

The `rails` plugin consumes [Ruby on Rails](https://rubyonrails.org/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `file_log_path` | `strings` | `[]` | An array of file log path glob patterns. | 
| `exclude_file_log_path` | `strings` | `[]` | An array of file log path glob patterns to be excluded. | 
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: rails
  file_log_path: "/path/to/logs.log"
- type: stdout

```
