# Evaluatie Enterprise Linux

| :---          | :---                                            |
| Student       | Robin ROELANDT                                  |
| Klasgroep     | aalst                                           |
| Email         | <mailto:robin.roelandt.w1325@student.hogent.be> |
| Hoofdopdracht | SME                                             |
| Repo          | <git@github.com:RobinRoelandt/elnx-sme.git>     |

## Hoofdopdracht

W4:

- Labo 0: nog te doen: admin-gebruiker met SSH-key!
- Bezig met LAMP -> tandje bijsteken!
- Gebruik `host_vars/SERVER.yml` en `group_vars/all.yml` voor instellingen specifiek voor je opstelling. De code van de rollen moet ongewijzigd blijven! Anders zijn ze niet herbruikbaar.

Problemen via e-mail tijdens examenperiode:

- DHCP-server "werkt niet"
    - start niet op, "no subnet declaration for enp0s8"
    - Fout in IP-adres (176.16.0.2 ipv 172.16.0.2). Niet opgemerkt, ook na tips ivm vergelijken IP-adres pr011 op enp0s8 met dat van de subnetdeclaratie
    - Default GW opnieuw ingesteld op verkeerd IP-adres (192.0.2.254, wat buiten het eigen subnet 172.16.0.0/16 ligt)
    - Verkeerde DNS-servers ingesteld voor werkstations (192.0.2.10-11 ipv de router)
- Geeft blijk van onvoldoende inzicht op niveau 3 TCP/IP!

Eindevaluatie:

- Acceptatietests: LAMP, DNS, fileserver: ok!
- Werkstation:
    - Internettoegang & lokale website ok
    - Samba via NetBIOS ok
    - FTP via FQDN ok

### Eindbeoordeling

O1: Deskundig

## Troubleshooting

### Eerste troubleshooting-opdracht

- Algemeen:
    - Beschrijving eindresultaat ontbreekt
    - Verslag is onvolledig
    - Schrijf geen opstel, gebruik bullet-points
    - Gebruik correcte Markdown!
- Datalinklaag:
    - Verkeerdelijk 'fysieke laag' genoemd in het verslag
    - Is de VM aangesloten op een HO-interface met correcte instellingen?
- Internetlaag:
    - onvolledig: GW? Bereikbaarheid binnen LAN (bv. pingen van host -> VM)
- Transportlaag:
    - "bij verder onderzoek" -> zeg dan wat je onderzocht hebt, welke commando's je gebruikt hebt, en wat het verwachte / bekomen resultaat was

Beoordeling voor deze opdracht: nog niet bekwaam

### Tweede troubleshooting-opdracht

Vrij goed opgemaakt verslag, ziet er ok uit wanneer gerenderd in HTML. Merk op dat na de "hashes" die een titel aanduiden (`###`) een spatie moet komen

- Internetlaag: ok
- Transportlaag:
    - Controleer met `ss` ook op welke interfaces de service luistert. In dit geval enkel `lo`! Daardoor is service niet bereikbaar vanop hostsysteem
    - Service start op
- Resultaat:
    - Service niet bereikbaar vanaf hostsysteem
    - Resultaat acceptatietests niet beschreven

Beoordeling: nog niet bekwaam

### Derde troubleshooting-opdracht

Ok!

### Eindbeoordeling

O2: Bekwaam

## Opdracht Actualiteit

- Squirrelmail-rol voor Ansible geschreven, samen met Florian
- Eigen commits vooral documentatie

### Eindbeoordeling

O3: Bekwaam

## Rapportering

### Laboverslagen

R1: Deskundig

### Demonstraties

- Voorbereiding op papier, vrij vlot
- Kon de FTP-server niet zelf demonstreren

R2: Gevorderd

### Cheat sheet

Niet systematisch bijgehouden, 1 commit een paar dagen voor eindevaluatie

R3: Nog niet bekwaam

