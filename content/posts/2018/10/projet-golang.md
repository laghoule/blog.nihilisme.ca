+++
categories = ["coding", "projet" ]
date = 2018-10-27T20:38:29Z
description = ""
draft = false
cover = "/posts/2018/10/Human_resource_strategy-12-512.png"
slug = "projet-golang"
tags = ["coding", "projet" ]
title = "Projet Golang"

+++

Apres plusieurs jours de reflexions sur le genre de projets que je veux entreprendre pour apprendre GO, j'ai finalement eu une bonne idee, du moins selon moi.

Mon projet consistrera a ecrire un agent client en GO pour calculer le temps reponse d'une site web, ou un api. Cet agent pourra etre executer dans un Lambda AWS, dans plusieurs region AWS. Je vais creer les ressources Terraform necessaire pour l'installation rapide et securitaire. Comme le cout d'utilisation d'une Lambda est a la seconde, il sera possible de rouller selon un laps de temps, et un interfal predefinie.

Cet agent utilisera une Queue SQS pour stocker temporairement ces donnees, qui sera receilli par l'agent serveur, qui exportera ces donnees dans une database InfluxDB.

Je vais fournir les dashboards Grafana pour afficher les metriques selon les differente regions du monde ou seront deployer les Lambda.

{{< bookmark url="https://github.com/laghoule/reptime" thumbnail="https://opengraph.githubassets.com/ef607e920731cb02bfb41fdabd7a644c105acb20334031eabdabd724a8d5295b/laghoule/reptime" caption="" >}}
