# `BindPlane Agent` plugin

The `bindplane_agent` plugin consumes [BindPlane Universal Agent](https://docs.bindplane.bluemedora.com/docs/universal-agent-overview) log entries and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: bindplane_agent
- type: stdout

```
