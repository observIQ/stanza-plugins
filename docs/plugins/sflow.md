# `sFlow` plugin

The `sflow` plugin consumes [sFlow](https://sflow.org/) logs and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `listen_port` | `int` | `6343` | A port which the agent will listen for syslog messages |
| `sampling_enable` | `bool` | `false` | Enable sFlow sampling | 
| `sampling_drop_rate` | `enum` | `""` | The probability an entry is dropped. A value of 1.0 will drop 100% of matching entries, while a value of 0.0 will drop 0%. | 
| `listen_ip` | `string` | `"0.0.0.0"` | A syslog ip address of the form `<ip>` | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: sflow
- type: stdout

```

With sampling drop rate defined:

```yaml
pipeline:
- type: sflow
  sampling_enable: true
  sampling_drop_rate: 0.3
- type: stdout

```
