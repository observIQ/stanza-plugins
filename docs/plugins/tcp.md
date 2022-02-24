# `TCP` plugin

The `tcp` plugin consumes [TCP](https://en.wikipedia.org/wiki/Transmission_Control_Protocol) log entries from the local filesystem and outputs parsed entries. 

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `listen_port` | `int` | `` | A port which the agent will listen for tcp messages |
| `log_type` | `string` | `"tcp"` | Adds the specified 'Type' as a label to each log message. | 
| `listen_ip` | `string` | `"0.0.0.0"` | A ip address of the form `<ip>` | 
| `add_labels` | `bool` | `true` | Adds net.transport, net.peer.ip, net.peer.port, net.host.ip and net.host.port labels. | 
| `enable_tls` | `bool` | `false` | Enable TLS for the TCP listener | 
| `certificate_file` | `string` | `"/opt/cert"` | File path for the X509 TLS certificate chain | 
| `private_key_file` | `string` | `"/opt/key"` | File path for the X509 TLS private key path | 
| `min_version` | `enum` | `1.0` | What minimum version of TLS to use |

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: tcp_input
  listen_port: 601
- type: stdout

```

With TLS enabled:

```yaml
pipeline:
- type: tcp_input
  listen_port: 601
  enable_tls: true
- type: stdout

```
