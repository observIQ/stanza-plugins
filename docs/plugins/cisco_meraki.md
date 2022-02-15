# `cisco_meraki` plugin

The `cisco_meraki` plugin receives logs from [Cisco Meraki](https://meraki.cisco.com/) network devices and outputs a parsed entry.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `listen_port` | `int` | `514` | A port which the agent will listen for udp messages |
| `listen_ip` | `string` | `"0.0.0.0"`  | A UDP ip address of the form `<ip>` |
| `listen_address` | `string` | `""` | Parameter Deprecated Use `listen_ip` and `listen_port` instead. | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: cisco_meraki
- type: stdout

```

With non-standard port and IP:

```yaml
pipeline:
- type: cisco_meraki
  listen_port: 6514
  listen_ip: "10.0.0.1"
- type: stdout

```
