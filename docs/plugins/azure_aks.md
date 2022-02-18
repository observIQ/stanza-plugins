# `Azure AKS` plugin

The `azure_aks` plugin consumes [Azure AKS](https://azure.microsoft.com/en-us/services/kubernetes-service/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `container_log_path` | `string` | `"/var/log/containers/*"` | AKS Containers Log Path |
| `kubelet_journald_log_path` | `string` | `""` | Kubernetes Kubelet Journald Log path. It will read from /run/journal or /var/log/journal if this parameter is omitted | 
| `cluster_name` | `string` | `""` | Cluster Name to be added to a resource label | 
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: azure_aks
- type: stdout

```

With non-standard system log path:

```yaml
pipeline:
- type: azure_aks
  system_log_path: "/path/to/logs"
- type: stdout

```
