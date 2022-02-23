# `observIQ Agent` plugin

The `observiq_agent` plugin consumes [observIQ Agent]() log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: observiq_agent
- type: stdout

```

