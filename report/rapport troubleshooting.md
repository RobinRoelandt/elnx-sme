# Troubleshooten Entreprise Linux

- Gemaakt door: Robin Roelandt
- Datum: 20/1/2018

## Router

## Netwerklaag

|Te controleren                 |Verwachte waarde               |Gebruikte commando's|Correct?|
| :---                          | :---                          |:---                |:---    |
|Is de kabel correct aangesloten|De kabel is correct aangesloten|ip link             |   V    |


## Internetlaag

|Te controleren|Verwachte waarde                                   |Gebruikte commando's|Correct?|
| :---         | :---                                              | :---               | :---   |
|IP adress     |Indien NAT: 10.0.2.15/24, Intern: 172.20.0.254/24  |ip a                |   V    |
|DG            |Indien NAT: 10.0.2.2, Intern: 172.20.0.0           |ip r                |   V    |
|DNS server    |10.0.2.3, 172.20.0.254                             |cat /ect/resolv.conf|   V    |


## Transportlaag
|Te controleren                 |Verwachte waarde          |Gebruikte commando's          |Correct?|
| :---                          | :---                     | :---                         | :---   |
|Niets te controleren, aangezien router enkel instaat voor NAT translatie| / | / | / |


## Applicatielaag

|Te controleren                         |Gebruikte commando's                                   |Correct?|
| :---                                  | :---                                                    |:---|
|Niets te controleren, aangezien router enkel instaat voor NAT translatie| / | / |


## Server

## Netwerklaag

|Te controleren                 |Verwachte waarde               |Gebruikte commando's|Correct?|
| :---                          | :---                          |:---                |:---    |
|Is de kabel correct aangesloten|De kabel is correct aangesloten|ip link             |   V    |


## Internetlaag

|Te controleren|Verwachte waarde                                   |Gebruikte commando's|Correct?|
| :---         | :---                                              | :---               | :---   |
|IP adress     |NAT: 10.0.2.15/24, Intern: 172.20.0.2/24           |ip a                |   V    |
|DG            |Indien NAT: 10.0.2.2, intern: 172.20.0.0           |ip r                |   V    |
|DNS server    |10.0.2.3                                           |cat /ect/resolv.conf|   V    |

## Transportlaag
|Te controleren                 |Verwachte waarde          |Gebruikte commando's          |Correct?|
| :---                          | :---                     | :---                         | :---   |
|Draait Service                 |Ja                        |sudo systemctl status dnsmasq |   X    |
|Draait Service                 |Ja                        |sudo systemctl status dhcpd   |   X    |
|Draait Service                 |Ja                        |sudo systemctl status httpd   |   X    |
|Correcte poort/interface       |53, 67, 68                |sudo ss -tulpn                |   V    |
|Firewall instellingen          |services: dhcp, dns, http |sudo firewall-cmd --list-all  |   V    |

#### Hoe zijn de problemen opgelost?

- DNSMasq draait niet:
commando's om probleem op te lossen:
sudo systemctl start dnsmasq

(permanent starten van service bij booten: chkconfig dnsmasq)

- DHCP service draait niet:
commando's om dit probleem op te lossen:
sudo systemctl start dnsmasq

(permanent starten van service bij booten: chkconfig dhcpd)

- httpd service draait niet:
commando's om dit probleem op te lossen:
sudo systemctl start httpd

(permanent starten van service bij booten: chkconfig httpd)

## Applicatielaag

|Te controleren                         |Gebruikte commando's                |Correct?|
| :---                                  | :---                               |:---    |
|Configuratie DNSMasq controleren       |sudo vi /etc/hosts                  |   V    |
|Configuratie dhcp                      |sudo vi /etc/dhcp/dhcpd.conf        |   V    |
|Configuratie httpd controleren         |sudo vi /etc/httpd/conf/httpd.conf  |   V    |

### Conclusie

Na het toepassen van al deze fixes voor de verschillende problemen slagen alle acceptatie testen op het workstation en is het mogelijk om via handmatige controle de werking van de verschillende services te verifiëren op het systeem.
