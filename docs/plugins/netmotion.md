# `NetMotion` plugin

The `netmotion` plugin consumes [NetMotion](https://www.netmotionsoftware.com/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `listen_address` | `string` | `"0.0.0.0:514"` | A TCP network address of the form `<ip>:<port>` |


## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: netmotion
- type: stdout

```

With non-standard address:

```yaml
pipeline:
- type: netmotion
  listen_address: "10.0.0.1:514"
- type: stdout

```
