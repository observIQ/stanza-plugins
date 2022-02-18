# `Amazon CloudWatch` plugin

The `aws_cloudwatch` plugin consumes [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `log_group_names` | `strings` | `[]` | List of Cloudwatch Log Group Names. | 
| `log_group_prefix` | `string` | `""` | The log group name prefix to use, when auto detecting log group names. | 
| `region` | `string` | `""` | The AWS Region to be used | 
| `log_stream_name_prefix` | `string` | `""` | The log stream name prefix to use, valid only when targeting a single log group. | 
| `log_stream_names` | `strings` | `[]` | Log stream names from which to get events, valid only when targeting a single log group. | 
| `profile` | `string` | `""` | Profile to use for authentication. | 
| `event_limit` | `int` | `10000` | The maximum number of events to return per call. | 
| `poll_interval` | `string` | `"1m"` | The duration between event calls. | 
| `log_type` | `string` | `"aws_cloudwatch"` | Adds label log_type to identify AWS Cloudwatch Log source | 
| `start_at` | `enum` | `end` | Start reading file from 'beginning' or 'end' | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: aws_cloudwatch
  region: "US West"
- type: stdout

```

With non-standard poll interval:

```yaml
pipeline:
- type: aws_cloudwatch
  region: "US West"
  poll_interval: "2m"
- type: stdout

```
