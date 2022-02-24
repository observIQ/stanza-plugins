# `Ubiquiti` plugin

The `ubiquiti` plugin consumes [Ubiquiti](https://www.ui.com/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `listen_port` | `int` | `514` | A port which the agent will listen for syslog messages |
| `location` | `enum` | `"UTC"` | The geographic location (timezone) to use when parsing the timestamp | 
| `listen_ip` | `string` | `"0.0.0.0"` | A syslog ip address of the form `<ip>` | 


## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: ubiquiti
- type: stdout

```

With geographic location defined:

```yaml
pipeline:
- type: ubiquiti
  location: "Africa/Abdijan"
- type: stdout

```
