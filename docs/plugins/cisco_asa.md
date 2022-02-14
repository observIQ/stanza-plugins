# `cisco_asa` plugin

The `cisco_asa` plugin receives syslog messages from [Cisco ASA](https://en.wikipedia.org/wiki/Cisco_ASA) network devices and outputs a parsed entry.

## Configuration Fields

| Field | Default | Description |
| --- | --- | --- |
| `listen_port` | `5140` | A TCP port which the agent will listen for syslog messages |
| `listen_ip` | `"0.0.0.0"`  | A syslog ip address of the form `<ip>` |

## Example usage

### Configuration

Using default listen port and IP:

```yaml
pipeline:
- type: cisco_asa
- type: stdout

```

With non-standard listen port and IP:

```yaml
pipeline:
- type: cisco_asa
  listen_port: 601
  listen_ip: "10.0.0.1"
- type: stdout

```
