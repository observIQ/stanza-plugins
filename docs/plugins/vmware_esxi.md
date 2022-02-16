# `VMware ESXi` plugin

The `vmware_esxi` plugin consumes [VMware ESXi](https://www.vmware.com/products/esxi-and-esx.html) log entries from the local filesystem and outputs parsed entries. 

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `listen_port` | `int` | `5140` | A port which the agent will listen for syslog messages | 
| `listen_ip` | `string` | `"0.0.0.0"` | A ip address of the form `<ip>` | 
| `enable_tls` | `bool` | `false` | Enable TLS for the TCP listener | 
| `certificate_file` | `string` | `"/opt/cert"` | File path for the X509 TLS certificate chain | 
| `private_key_file` | `string` | `"/opt/key"` | File path for the X509 TLS private key path | 

## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: vmware_esxi
- type: stdout

```

With TLS enabled:

```yaml
pipeline:
- type: vmware_esxi
  enable_tls: true
- type: stdout

```
