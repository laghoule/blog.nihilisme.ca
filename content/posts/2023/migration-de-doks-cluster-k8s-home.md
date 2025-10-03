+++
date = 2023-04-09T00:19:49Z
description = ""
draft = false
image = "__GHOST_URL__/content/images/2023/04/photo-1558494949-ef010cbdcc31.jpeg"
slug = "migration-de-doks-cluster-k8s-home"
title = "Migration de DOKS -> cluster K8S@home"

+++


Et oui, le temps des coupures est arriver, je migre mon cluster K8S vers mon propre cluster Kubernetes a la maison.

Plus de details a venir, mais un petit apercu:

* Un Control-plane (oui, oui c'est pas en HA): 1 Celeron 4 core, 8G RAM, 128G nvme
* Trois worker: 1 Celeron (11 gen) 4 core, 16G RAM, 500G nvme

