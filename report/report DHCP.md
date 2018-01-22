# Enterprise Linux Lab Report

- Student name: Robin Roelandt
- Github repo: <https://github.com/RobinRoelandt/elnx-sme>

## Doel van de taak

Een server opzetten met behulp van ansible die ervoor zorgt dat clients die aangesloten zijn op het netwerk dynamisch een IP adres of een gereserveerd IP adres (op basis van het MAC adres) toegewezen krijgen.

## Test plan

Voor deze server zijn er geen automatische tests voorzien, dus dient de werking van de server handmatig gecontroleerd te worden.
Hiervoor dient een nieuwe virtuele machine aangemaakt te worden in Virtualbox en dient men op deze machine Ubuntu te installeren.
Na het succesvol installeren van Ubuntu past u de netwerkadapters van de virtuele machine aan en zorgt u ervoor dat er 2 host-only adapters voorzien zijn met als netwerkinstellingen 172.16.0.0 255.255.0.0.

Noteer het MAC van 1 van de adapters en voeg dit toe aan de ansible configuratie en laat het script nogmaals runnen op de server.

Start na het succesvol aflopen van het script de virtuele machine opnieuw op en verifieër dat er een IP adres is uitgedeeld in de correcte range en dat het gereserveerde IP correct is via het commando ``ip a`` in de terminal.
(De range van IP adressen die uitgedeeld morgen worden is: 172.16.192.1 tot 172.16.255.253)

## Procedure/Documentation

Describe *in detail* how you completed the assignment, with main focus on the "manual" work. It is of course not necessary to copy/paste your code in this document, but you can refer to it with a hyperlink.

Make sure to write clean Markdown code, so your report looks good and is clearly structured on Github.

## Test report

The test report is a transcript of the execution of the test plan, with the actual results. Significant problems you encountered should also be mentioned here, as well as any solutions you found. The test report should clearly prove that you have met the requirements.

## Resources

List all sources of useful information that you encountered while completing this assignment: books, manuals, HOWTO's, blog posts, etc.
