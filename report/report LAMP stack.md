# Enterprise Linux Lab Report

- Student name: Robin Roelandt
- Github repo: <https://github.com/RobinRoelandt/elnx-sme>

## Doel van de taak

- Installeren van MariaDB, Apache en Wordpress

## Test plan

Deze opstelling kan getest worden met de geautomatiseerde tests alsook door de wordpress pagina te bezoeken onder volgende hyperlink: http://192.0.2.50/wordpress

## Procedure/Documentation

De vereiste rollen worden aangevuld in het ![site.yml](https://github.com/RobinRoelandt/elnx-sme/blob/master/ansible/site.yml) bestand en de configuratie is te vinden in het ![pu004.yml](https://github.com/RobinRoelandt/elnx-sme/blob/master/ansible/host_vars/pu004.yml) bestand.

Voor deze server dienen er ook aangepaste certificaten aangemaakt te worden, en deze dienen gekopieërd te worden in de correcte mappen op de server. Voor het genereren van deze certificaten heb ik de site gevold die onderaan de pagina een link voor terug te vinden is. Deze certificaten worden op de server op de correcte plaats geplaatst in ![site.yml](https://github.com/RobinRoelandt/elnx-sme/blob/master/ansible/site.yml) en in ![pu004.yml](https://github.com/RobinRoelandt/elnx-sme/blob/master/ansible/host_vars/pu004.yml) is het pad naar deze certificaten gedefinieërd.

De firewall moet de correcte services doorlaten om de website en de databank te kunnen bereiken, in dit geval moet http en https doorgelaten worden.

De scripting taal van httpd is php.

Er is ook een user voor wordpress en mariadb aangemaakt. Deze user heeft beheerrechten op de databank. Er is ook een databank voorzien voor de wordpress site.

## Test report

Om de opstelling te testen kunnen we de host pu004 provisionen aangezien deze al aangemaakt is in het vorige testrapport (dit kan met het commando: ```vagrant provision pu004```). Na het voltooien van de installatie kunnen we wederom connecteren met de server door het commando 'vagrant ssh pu004' en voeren we de tests nogmaals uit (met het commando: ```sudo /vagrant/test/runbats.sh```).

[Succesvolle tests lamp stack](Screenshots/LAMP_stack.JPG)

Indien al deze tests slagen zou de webpagina van wordpress te zien moeten zijn door te surfen naar deze ![link](http://192.0.2.50/wordpress).
De testpagina van Apache is te zien via deze ![link](http://192.0.2.50).

## Resources

- ![Aanmaken ssl certificaten](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs)
- ![rhbase](https://github.com/bertvv/ansible-role-rh-base)
- ![MariaDB](https://github.com/bertvv/ansible-role-mariadb)
- ![Httpd](https://github.com/bertvv/ansible-role-httpd)
- ![Wordpress](https://github.com/bertvv/ansible-role-wordpress)
