# `solr` plugin

The `solr` plugin consumes [Apache Solr](https://solr.apache.org/) log entries from the local filesystem and outputs parsed entries.

## Configuration Fields

| Field           | Default                     | Description           |
|-----------------|-----------------------------|-----------------------|
| `file_log_path` | `"/var/solr/logs/solr.log"` | Path to solr log file |
| `start_at` | `end` | Start reading file from 'beginning' or 'end' | |

## Example usage

### Configuration

Using default file log paths:

```yaml
pipeline:
- type: solr
- type: stdout

```

Using non-default file parameters:

```yaml
pipeline:
- type: solr
  file_log_path:
    - "/path/to/logs"
- type: stdout

```

Input Entry
```log
2022-01-06 04:16:08.794 INFO  (qtp1489933928-64) [   x:gettingstarted] o.a.s.c.S.Request [gettingstarted]  webapp=/solr path=/get params={q=*:*&_=1641440398872} status=0 QTime=2
```

Output Entry

```json
{
    "timestamp": "2022-01-06T04:16:08.794-05:00",
    "severity": 30,
    "severity_text": "INFO",
    "labels": {
        "file_name": "solr.log",
        "log_type": "solr",
        "plugin_id": "solr"
    },
    "record": {
        "collection": "",
        "core": "gettingstarted",
        "exception": "",
        "message": "[gettingstarted]  webapp=/solr path=/get params={q=*:*\u0026_=1641440398872} status=0 QTime=2",
        "replica": "",
        "shard": "",
        "source": "o.a.s.c.S.Request",
        "thread": "qtp1489933928-64"
    }
}
```
