+++
categories = ["observation", "technologie"]
date = 2020-11-07T15:04:09Z
description = ""
draft = false
cover = "/posts/2020/11/clint-patterson-yGPxCYPS8H4-unsplash.jpg"
slug = "upgrade-doks-1-18-1-19"
tags = ["observation", "technologie"]
title = "Upgrade DOKS 1.18 -> 1.19"

+++

Premiere experience d'upgrade du managed K8S de Digital Ocean. Voici quelques observations:

* Appliquer les recommandations que linter d'upgrade de DOKS vous propose. AWS EKS devrait s'inspirer de ce tools pour proposer quelques choses de similaire.
* Ne pas utiliser les addons proposer par doks (ingress, grafana, prometheus, etc). Utiliser helm pour installer ces tools, car vous aurez pas de controle (possible d'aller recupere les values de leur helm, mais pas trivial) sur de modification que vous voudriez mettre en place (Pod Disruption Budget, node Affinity/AntiAffinity).
* Si vous avez pas d'autoscaler de worker de configurer, manuellement doubler le nombre de worker avant de debuter votre upgrade. Vous allez eviter de manquer de ressources. Scale down quand tout est upgrader.

L'upgrade a ete effectuer assez rapidement, et sans heurt.

Chapeau a DigitalOcean!
