# Enterprise Linux Lab Report

- Student name: Robin Roelandt
- Github repo: <https://github.com/RobinRoelandt/elnx-sme.git>

## Doel van de taak

- Basis opstelling server
- Installeren correcte rollen en packages
- Configureren rollen

## Test plan

Het controleren kan volledig gebeuren via de geautomatiseerde test. Hiervoor moet 1 host opgezet worden met de correcte rol om de packages te installeren en correct te configureren.

## Procedure/Documentation

### Configureren van de servers

De hosts worden gedefinieërd en de rollen die dienen geïnstalleerd te worden, zijn in het ![site.yml](https://github.com/RobinRoelandt/elnx-sme.git) bestand te vinden.

Het installeren van de juiste software en het configureren van de servers, met parameters die nodig zijn op elke server, is terug te vinden in het ![all.yml](https://github.com/RobinRoelandt/elnx-sme/blob/master/ansible/group_vars/all.yml) bestand dat te vinden is in de map ![group_vars](https://github.com/RobinRoelandt/elnx-sme/tree/master/ansible/group_vars).
In dit bestand worden de benodigde packages geïnstalleerd en de Administrator robin aangemaakt. Er is ook gezorgd dat de user kan aanloggen met een ssh_key die gedefinieërd kan worden met rhbase_ssh_key.

## Test report

Om de opstelling te testen dienen we 1 host op te zetten. Hiervoor wordt het ![site.yml](https://github.com/RobinRoelandt/elnx-sme.git) aangepast om de host pu004 op te laten starten, en hier wordt voorlopig enkel de rol ![rhbase](https://github.com/bertvv/ansible-role-rh-base) geïnstalleerd om de opstelling te testen.

De host wordt opgezet met het commando 'vagrant up pu004' in git bash.
Na het voltooien van de installatie kan er worden geconnecteerd met de host door het commando 'vagrant ssh pu004' en door de meegegeven tests kan de werking van de server geverifieërd worden (te gebruiken commando: sudo /vagrant/test/runbats.sh).

![Succesvolle tests server configuratie](https://github.com/RobinRoelandt/elnx-sme/blob/master/report/Screenshots/Server%20configuration.JPG)

## Resources

- ![rhbase rol](https://github.com/bertvv/ansible-role-rh-base)
- ![genereren van ssh key](https://help.github.com/articles/connecting-to-github-with-ssh/)
