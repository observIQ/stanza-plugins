# `MacOS` plugin

The `macos` plugin consumes [MacOS](https://en.wikipedia.org/wiki/MacOS) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `enable_system_log` | `bool` | `true` | Enable to collect MacOS system logs. |
| `system_log_path` | `string` | `"/var/log/system.log"` | The absolute path to the System log. | 
| `enable_install_log` | `bool` | `true` | Enable to collect MacOS install logs. |
| `install_log_path` | `string` | `"/var/log/install.log"` | The absolute path to the Install log. | 
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: macos
- type: stdout

```

With the install log disabled:

```yaml
pipeline:
- type: macos
  enable_install_log: false
- type: stdout

```
