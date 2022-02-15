# `NetFlow` plugin

The `netflow` plugin consumes [NetFlow](https://en.wikipedia.org/wiki/NetFlow) logs from a NetFlow collector and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `listen_port` | `int` | `2055` | A port which the agent will listen for syslog messages |
| `netflow_version` | `enum` | `""` | The netflow version (`v5`, `v9 / IPFIX`) | 
| `sampling_enable` | `bool` | `false` | Enable Netflow sampling | 
| `sampling_drop_rate` | `enum` | `""` | The probability an entry is dropped. A value of 1.0 will drop 100% of matching entries, while a value of 0.0 will drop 0%. | 
| `listen_ip` | `string` | `"0.0.0.0"` | A syslog ip address of the form `<ip>` | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: netflow
  netflow_version: ipfix
- type: stdout

```

With sampling drop rate defined:

```yaml
pipeline:
- type: netflow
  netflow_version: ipfix
  sampling_enable: true
  sampling_drop_rate: 0.4
- type: stdout

```
