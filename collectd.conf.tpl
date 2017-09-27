Hostname "{{ HOSTNAME }}"

FQDNLookup false
Interval 10
Timeout 2
ReadThreads 5
WriteThreads 5

LoadPlugin cpu
LoadPlugin interface
LoadPlugin load
LoadPlugin memory
LoadPlugin network
LoadPlugin write_http

<Plugin write_http>
 <Node "example"> 
    URL "https://192.168.0.14:8088/services/collector/raw"
    Header "Authorization: Splunk fdace74f-7da8-40af-bfce-bac0dd10a144"
    Format "JSON"
    VerifyPeer false
    VerifyHost false
    Metrics true
    StoreRates true
  </Node>
</Plugin>

<Plugin cpu>
  ReportByCpu true
</Plugin>

<Plugin load>
    ReportRelative true
</Plugin>

<Plugin memory>
    ValuesAbsolute true
    ValuesPercentage true
</Plugin>




Include "/etc/collectd/collectd.d/*.conf"
