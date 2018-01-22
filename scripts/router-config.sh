#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

configure

# Fix for error "INIT: Id "TO" respawning too fast: disabled for 5 minutes"
delete system console device ttyS0

#
# Basic settings
#
set system host-name 'Router'
set service ssh port '22'

#
# IP settings
#

# TODO
set interfaces ethernet eth0 address dhcp
set interfaces ethernet eth0 description 'WAN'

set interfaces ethernet eth1 address 192.0.2.254/24
set interfaces ethernet eth1 description 'DMZ'

set interfaces ethernet eth2 address 172.16.255.254/16
set interfaces ethernet eth2 description 'internal'

set system gateway-address 10.0.2.15
#
# Network Address Translation
#

# TODO
set nat source rule 100 outbound-interface 'eth0'
set nat source rule 100 source address '172.16.0.0/16'
set nat source rule 100 translation address 'masquerade'

set nat source rule 101 outbound-interface 'eth1'
set nat source rule 101 source address '172.16.0.0/16'
set nat source rule 101 translation address 'masquerade'

set nat source rule 200 outbound-interface 'eth0'
set nat source rule 200 source address '192.0.2.0/24'
set nat source rule 200 translation address 'masquerade'

#
# Time
#

set system ntp server 3.be.pool.ntp.org
set system ntp server 1.europe.pool.ntp.org
set system ntp server 0.europe.pool.ntp.org
set system time-zone 'Europe/Brussels'
#

#
# Domain Name Service
#

# TODO
set service dns forwarding domain avalon.lan server 192.0.2.10
set service dns forwarding name-server 8.8.8.8 #193.190.173.1  # DNS server van Hogent of GOOGLE DNS OM THUIS TE TESTEN
set service dns forwarding listen-on 'eth2'
# Make configuration changes persistent
commit
save

# Fix permissions on configuration
sudo chown -R root:vyattacfg /opt/vyatta/config/active

# vim: set ft=sh
