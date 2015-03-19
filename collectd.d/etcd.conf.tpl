LoadPlugin curl_json

<Plugin curl_json>
  <URL "http://{{ HOSTNAME }}:4001/v2/stats/self"> 
    Instance "etcd"
    <Key "recvAppendRequestCnt">
      Type "counter"
    </Key>
    <Key "recvBandwidthRate">
      Type "guage"
    </Key>
    <Key "recvPkgRate">
      Type "guage"
    </Key>
    <Key "sendAppendRequestCnt">
      Type "counter"
    </Key>
  </URL>
</Plugin>
