---
title: Certificate verify failed on a puppet client
date: 2013-05-12 09:51 UTC
layout: post
categories:
- Other
tags:
- puppet
- certificates
- ssl
published: true
banner: /images/uploads/2013/05/banner-certificate-verify-failed-on-a-puppet-client.jpg
---

``` plain
Warning: Unable to fetch my node definition, but the agent run will continue:
Warning: SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed: [unable to get certificate CRL for /CN=puppetmaster]
```

I’ve only seen this error if the system time is not the same between the master and agent. To resolve this, install ntp on the master and agent and make sure the times are synced. You’ll need to remove the cert on the master if it’s been accepted.

``` bash
puppet cert clean ‘agent-name’
```

Now you’ll have to clean up the certs on the agent.

``` bash
find /var/lib/puppet -type f -print0 |xargs -0r rm
```

You should be good to go and try again.
