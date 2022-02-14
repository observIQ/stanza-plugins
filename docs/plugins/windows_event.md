# `windows_event` plugin

The `windows_event` plugin consumes Windows Event log entries from the Windows Event Viewer API and outputs parsed entries.

## Supported Platforms

- Windows

## Configuration Fields

| Field | Default | Description |
| --- | --- | --- |
| `enable_system_events` | `true` | Enable to collect system event logs |
| `enable_application_events` | `true` | Enable to collect application event logs |
| `enable_security_events` | `true`  | Enable to collect security event logs |
| `enable_custom_channels` | `false` | Enable to collect custom event logs from provided channels |
| `custom_channels` | `-''` | Add custom channels to get event logs  |
| `max_reads` | `100` | The maximum number of records read into memory, before beginning a new batch |
| `poll_interval` | `1` | The interval, in seconds, at which the channel is checked for new log entries. This check begins again after all new records have been read |
| `start_at` | `end` | Start reading file from 'beginning' or 'end' |

## Prerequisites

### Custom Channels

The Windows Events plugin can monitor custom channels in addition to the three configured by default. In order to add a custom channel, you need the name of it which can be found in the left sidebar of the Windows Event Viewer window.

## Configuration

The Windows Events plugin supports system, application, and security events by default, but can also support custom channels if those have been configured.

```yaml
pipeline:
- type: windows_event
  enable_system_events: true
  enable_application_events: true
  enable_security_events: true
- type: stdout

```

With custom channels enabled, the `custom_channels` field can be populated with any channel found in the Windows Event Viewer.

```yaml
pipeline:
- type: windows_event
  enable_system_events: true
  enable_application_events: true
  enable_security_events: true
  enable_custom_channels: true
  custom_channels:
    - 'Hardware Events'
    - 'Key Management Service'
- type: stdout

```
