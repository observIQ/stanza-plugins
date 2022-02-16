# `UDP` plugin

The `udp` plugin consumes [UDP](https://en.wikipedia.org/wiki/User_Datagram_Protocol) log entries from the local filesystem and outputs parsed entries. 

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `listen_port` | `int` | `` | A port which the agent will listen for udp messages |
| `log_type` | `string` | `"udp"` | Adds the specified 'Type' as a label to each log message. | 
| `listen_ip` | `string` | `"0.0.0.0"` | A UDP ip address of the form `<ip>` | 
| `add_labels` | `bool` | `true` | Adds net.transport, net.peer.ip, net.peer.port, net.host.ip and net.host.port labels. | 


## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: udp_input
  listen_port: 
- type: stdout

```

With custom listen IP:

```yaml
pipeline:
- type: udp_input
  listen_port: 
  listen_ip: "10.0.0.1"
- type: stdout

```
