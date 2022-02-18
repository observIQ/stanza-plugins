# `Amazon EKS` plugin

The `amazon_eks` plugin consumes [Amazon EKS](https://aws.amazon.com/eks/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `container_log_path` | `string` | `"/var/log/containers/*"` | EKS Containers Log Path |
| `kubelet_journald_log_path` | `string` | `""` | Kubernetes Kubelet Journald Log path. It will read from /run/journal or /var/log/journal if this parameter is omitted | 
| `cluster_name` | `string` | `""` | Cluster Name to be added to a resource label | 
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: amazon_eks
- type: stdout

```

With non-standard system log path:

```yaml
pipeline:
- type: amazon_eks
  system_log_path: "/path/to/logs"
- type: stdout

```
