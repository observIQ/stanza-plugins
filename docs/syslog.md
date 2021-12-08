## `syslog` plugin

The `syslog` plugin receives [syslog](https://en.wikipedia.org/wiki/Syslog) from network devices and outputs a parsed entry.

### Configuration Fields

| Field              | Default          | Description |                                                                                                                                                                                                  
| ---                | ---              | ---         |                                                                                                                                                                                                     
| `listen_port`      | `514`            | Network port to listen on                                                              |                                                     
| `listen_ip`        | `0.0.0.0`        | A network interface for the agent to bind. Typically 0.0.0.0 for most configurations.  |
| `connection_type`  | `udp`            | Transport protocol to use (`udp` or `tcp`)                                             |
| `protocol`         | `rfc5424 (IETF)` | Protocol of received syslog messages (`rfc3164` or `rfc5424`)                          |
| `location`         | `UTC`            | [Geographic location (timezone)](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) to use when [parsing the timestamp](https://github.com/observIQ/stanza/blob/master/docs/types/timestamp.md) (Syslog RFC 3164 only) |

### Example usage:
 
#### Default Configuration

Stanza Pipeline

```yaml
pipeline:
- type: syslog
- type: stdout
```

Input Entry (sent with `echo "<message here>" | nc -u localhost 514`)

```
<165>1 2003-10-11T22:14:15.003Z mymachine.example.com evntslog - ID47 [exampleSDID@32473 iut="3" eventSource="Application" eventID="1011"] user connected
```

Output Entry

```json
{
  "timestamp": "2003-10-11T22:14:15.003Z",
  "severity": 40,
  "severity_text": "notice",
  "labels": {
    "log_type": "syslog",
    "net.host.ip": "::",
    "net.host.port": "514",
    "net.peer.ip": "::1",
    "net.peer.port": "37871",
    "net.transport": "IP.UDP",
    "plugin_id": "syslog"
  },
  "record": {
    "appname": "evntslog",
    "facility": 20,
    "hostname": "mymachine.example.com",
    "message": "user connected",
    "msg_id": "ID47",
    "priority": 165,
    "structured_data": {
      "exampleSDID@32473": {
        "eventID": "1011",
        "eventSource": "Application",
        "iut": "3"
      }
    },
    "version": 1
  }
}
```

#### Bind to IP address

Stanza Pipeline

```yaml
pipeline:
- type: syslog
  listen_ip: 10.99.1.10
- type: stdout
```

Input Entry (sent with `echo "<message here>" | nc -u 10.99.1.10 514`, use your machine's IP address)

```
<165>1 2003-10-11T22:14:15.003Z mymachine.example.com evntslog - ID47 [exampleSDID@32473 iut="3" eventSource="Application" eventID="1011"] user connected
```

Output Entry

```json
{
  "timestamp": "2003-10-11T22:14:15.003Z",
  "severity": 40,
  "severity_text": "notice",
  "labels": {
    "log_type": "syslog",
    "net.host.ip": "10.99.1.10",
    "net.host.port": "514",
    "net.peer.ip": "10.99.1.10",
    "net.peer.port": "33604",
    "net.transport": "IP.UDP",
    "plugin_id": "syslog"
  },
  "record": {
    "appname": "evntslog",
    "facility": 20,
    "hostname": "mymachine.example.com",
    "message": "user connected",
    "msg_id": "ID47",
    "priority": 165,
    "structured_data": {
      "exampleSDID@32473": {
        "eventID": "1011",
        "eventSource": "Application",
        "iut": "3"
      }
    },
    "version": 1
  }
}
```

#### rfc3164 with tcp Configuration

Stanza Pipeline

```yaml
pipeline:
- type: syslog
  protocol: rfc3164 (BSD)
  connection_type: tcp
  listen_port: 5140
- type: stdout
```

Input Entry (sent with `echo "<message here>" | nc localhost 5140`)

```
<34>Oct 11 22:14:15 mymachine su: 'su root' failed for lonvick on /dev/pts/8
```

Output Entry

```json
{
  "timestamp": "2021-10-11T22:14:15Z",
  "severity": 70,
  "severity_text": "crit",
  "labels": {
    "log_type": "syslog",
    "net.host.ip": "::1",
    "net.host.port": "5140",
    "net.peer.ip": "::1",
    "net.peer.port": "45316",
    "net.transport": "IP.TCP",
    "plugin_id": "syslog"
  },
  "record": {
    "appname": "su",
    "facility": 4,
    "hostname": "mymachine",
    "message": "su root failed for lonvick on /dev/pts/8",
    "priority": 34
  }
}
```

#### rfc3164 with location Configuration

Stanza Pipeline

```yaml
pipeline:
- type: syslog
  protocol: rfc3164 (BSD)
  connection_type: tcp
  listen_port: 5140
  location: America/Detroit
- type: stdout
```

Input Entry (sent with `echo "<message here>" | nc localhost 5140`)

```
<34>Oct 11 22:14:15 mymachine su: 'su root' failed for lonvick on /dev/pts/8
```

Output Entry

```json
{
  "timestamp": "2021-10-11T22:14:15-04:00",
  "severity": 70,
  "severity_text": "crit",
  "labels": {
    "log_type": "syslog",
    "net.host.ip": "::1",
    "net.host.port": "5140",
    "net.peer.ip": "::1",
    "net.peer.port": "45318",
    "net.transport": "IP.TCP",
    "plugin_id": "syslog"
  },
  "record": {
    "appname": "su",
    "facility": 4,
    "hostname": "mymachine",
    "message": "su root failed for lonvick on /dev/pts/8",
    "priority": 34
  }
}

```