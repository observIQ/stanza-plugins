# `HTTP` plugin

The `http` plugin consumes [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) log entries from the local filesystem and outputs parsed entries. 

## Configuration Fields

| Field | Type | Default | Description |
| --- | --- |--- | --- |
| `listen_port` | `int` | `` | A port which the agent will listen for tcp messages |
| `log_type` | `string` | `"tcp"` | Adds the specified 'Type' as a label to each log message. | 
| `listen_ip` | `string` | `"0.0.0.0"` | A ip address of the form `<ip>` | 
| `idle_timeout` | `string` | `60s` |  Sets idle timeout. | 
| `read_timeout` | `string` | `20s` | Sets read timeout. | 
| `write_timeout` | `string` | `"20s"` | Sets write timeout. | 
| `max_header_size` | `string` | `"1mb"` | Sets maximum header size. | 
| `max_body_size` | `string` | `"10mb"` | Sets maximum body size. | 
| `max_body_size` | `string` | `"10mb"` | Sets maximum body size accepted. | 
| `enable_tls` | `bool` | `false` | Enable TLS for the HTTP listener | 
| `certificate_file` | `string` | `"/opt/cert"` | File path for the X509 TLS certificate chain |
| `private_key_file` | `string` | `"/opt/key"` | File path for the X509 TLS certificate chain |
| `min_version` | `enum` | `"1.2"` | Minimum TLS version to accept connections|
| `enable_basic_auth` | `bool` | `false` | Enable Username and Password authentication |
| `username` | `string` | `"user"` | Username to use for basic authentication |  
| `password` | `string` | `"password"` | Password to use for basic authentication |  
| `enable_header_auth` | `bool` | `false` | Enable token authentication. |
| `auth_header` | `string` | `""` | Authentication header, a header that contains a token that matches one of the configured tokens |  
| `tokens` | `strings` | `[]` | An array of token values, used to compare against the value found in the header defined with the Authentication Header |  


## Example usage

### Configuration

Using default log paths:

```yaml
pipeline:
- type: http
  listen_port: 
- type: stdout

```

With TLS enabled:

```yaml
pipeline:
- type: http
  listen_port: 
  enable_tls: true
- type: stdout

```
