# `Sonicwall` plugin

The `sonicwall` plugin consumes [Sonicwall](https://www.sonicwall.com/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `listen_port` | `int` | `514` | A port which the agent will listen for udp messages |
| `location` | `enum` | `"UTC"` | The geographic location (timezone) to use when parsing the timestamp | 
| `listen_ip` | `string` | `"0.0.0.0"` | A UDP ip address of the form `<ip>` | 
| `add_labels` | `bool` | `true` | Adds net.transport, net.peer.ip, net.peer.port, net.host.ip and net.host.port labels. | 


## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: sonicwall
- type: stdout

```

With geographic location defined:

```yaml
pipeline:
- type: sonicwall
  location: "Africa/Abdijan"
- type: stdout

```
