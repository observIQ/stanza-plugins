# `VMware vCenter` plugin

The `vmware_vcenter` plugin consumes [VMware vCenter](https://www.vmware.com/products/vcenter-server.html) log entries from the local filesystem and outputs parsed entries. 

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `listen_port` | `int` | `5140` | A port which the agent will listen for syslog messages | 
| `listen_ip` | `string` | `"0.0.0.0"` | A ip address of the form `<ip>` | 
| `max_buffer_size` | `string` | `"1024kib"` | Maximum size of buffer that may be allocated while reading TCP input | 
| `enable_tls` | `bool` | `false` | Enable TLS for the TCP listener | 
| `certificate_file` | `string` | `"/opt/cert"` | File path for the X509 TLS certificate chain | 
| `private_key_file` | `string` | `"/opt/key"` | File path for the X509 TLS private key path | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: vmware_vcenter
- type: stdout

```

With TLS enabled:

```yaml
pipeline:
- type: vmware_vcenter
  enable_tls: true
- type: stdout

```
