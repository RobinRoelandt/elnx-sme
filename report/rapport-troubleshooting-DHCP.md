#Troubleshooten SME Entreprise Linux

- Gemaakt door: Robin Roelandt
- Datum: 20/1/2018

##Netwerklaag

|Te controleren                 |Verwachte waarde               |Gebruikte commando's|Correct?|
| :---                          | :---                          |:---                |:---    |
|Is de kabel correct aangesloten|De kabel is correct aangesloten|ip link             |   V    |


##Internetlaag

|Te controleren|Verwachte waarde                                   |Gebruikte commando's|Correct?|
| :---         | :---                                              | :---               | :---   |
|IP adress     |Indien NAT: 10.0.2.15/24, Hostonly: 172.16.0.2/16  |ip a                |   V    |
|DG            |Indien NAT: 10.0.2.2                               |ip r                |   V    |
|DNS server    |10.0.2.3                                           |cat /ect/resolv.conf|   V    |



##Transportlaag
|Te controleren                 |Verwachte waarde          |Gebruikte commando's          |Correct?|
| :---                          | :---                     | :---                         | :---   |
|Draait Service                 |Ja                        |sudo systemctl status dhcpd   |   X    |
|Correcte poort/interface       |68                        |sudo ss -tulpn                |   V    |
|Firewall instellingen          |dhcp in lijst van services|sudo firewall-cmd --list-all  |   X    |
####Hoe zijn de problemen opgelost?
- De fout in de logs bij het starten van de service:

No subnet declaration for enp0s8 (176.16.0.2).
** Ignoring requests on enp0s8, If this is not what you want, please write a subnet declaration in your dhcpd.conf file for the network segment to which interface enp0s8 is attached. **

Not configured to listen on any interfaces!

- De firewall heeft niet de correcte regels (eventuele oorzaak: ansible loopt voor deze stap vast?) Dit probleem kan opgelost worden door de service eerst handmatig toe te voegen en daarna de firewall service opnieuw op te starten.

Commando's om fout handmatig te verbeteren:

- sudo firewall-cmd --add-service=dhcp --permanent
- sudo systemctl restart firewalld

--> Hierna is de DHCP service nog altijd niet op te starten

##Applicatielaag

|Te controleren                         |Gebruikte commando's                                   |Correct?|
| :---                                  | :---                                                  |:---    |
|Configuratie DHCP controleren          |vi /etc/dhcp/dhcpd.conf                                |   V    |

verwachte configuratie:

max-lease-time 43200;
option subnet-mask 255.255.0.0;
option routers 172.16.255.254;
option domain-name "avalon.lan";

subnet 172.16.0.0 netmask 255.255.0.0 {
  default-lease-time 43200;
  range 172.16.192.1 172.16.255.253;
}

--> Dit is hetzelfde als mijn configuratie, maar toch start de service niet op.
