# `Azure Event Hub` plugin

The `azure_event_hub` plugin consumes [Azure Event Hub](https://azure.microsoft.com/en-us/services/event-hubs/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `namespace` | `string` | `""` | Event Hub Namespace |
| `event_hub_name` | `string` | `""`  | Event Hub Name |
| `group` | `string` | `""`  | Event Hub Consumer Group |
| `connection_string` | `string` | `""`  | Event Hub Connection String |
| `prefetch_count` | `int` | `1000`  | Event Hub Prefetch Count |
| `log_type` | `string` | `"azure_event_hub"`  | Adds label log_type to identify Azure Event Hub source |
| `start_at` | `end` | Start reading file from 'beginning' or 'end' |

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: azure_event_hub
  namespace:
  event_hub_name:
  group:
  connection_string: 
- type: stdout

```

With non-standard prefetch count:

```yaml
pipeline:
- type: azure_event_hub
  namespace:
  event_hub_name:
  group:
  connection_string: 
  prefetch_count: 500
- type: stdout

```
