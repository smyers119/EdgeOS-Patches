# EdgeOS-Patches

To make patches persist across upgrades add the .deb to
```
     /config/data/firstboot/install-packages
```

### ddclient 3.9.1.patch
#### Currently tested and working on versions after 1.9.7HF4
This patch was originially made to add support for dnsmadeeasy.  Since then there has been multiple providers and updates added.  To see the full list of updates goto: https://github.com/headhunter911/ddclient
### Vyatta-cfg-dhcp-server.patch
#### Currently tested and working on version 2.0.7 and below
This patch add's the ability to assign a persistant lease file
```
    file /config/dnsmasq-dhcp.leases
```

CLI example:

```
    uname@ubnt# set service dhcp-server lease-persist 
    Possible completions:
    enable	Enable persistant leases for dnsmasq
    disable	Disable persistant leases for dnsmasq (default)
```

NOTE:
* Supports all model's but only tested on ER-12 
* This currently only works for dnsmasq
* There is logic added that will not overwrite the dnsmsaq-dhcp-config.pl file if ubnt made changes to it since the last version



TODO:
* add log messages on error's
* add dhcpd support
  
  

