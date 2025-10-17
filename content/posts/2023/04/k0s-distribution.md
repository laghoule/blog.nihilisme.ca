+++
categories = ["produit"]
date = 2023-04-09T00:37:47Z
description = "K8S onPrem"
draft = false
cover = "/posts/2023/04/k0s-logo-full-color-light.svg"
slug = "k0s-distribution"
tags = ["produit"]
title = "K0S distribution"

+++

Avec la popularite de Kubernetes aujourd'hui, de multiples solutions d'installation sont disponible. Une de ces "distributions" est [K0S](https://web.archive.org/web/20230224143959/https://github.com/k0sproject/k0s). Creer au depart par [Mirantis](https://web.archive.org/web/20230224143959/https://www.mirantis.com/), et par la suite donner publier comme logiciel libre.

Apres quelques tests sur un cluster de dev, j'ai decider de poursuivre avec cette distribution pour mon home cluster "prod".

La configuration et l'installation est tres simple. Si vous avez deja utilise Rancher RKE1, c'est pratiquement la meme approche.

Pourquoi avoir choisi K0S? tout simplement pour essayer quelque chose de nouveau, qui s'upgrade facilement, et qui est maintenue.

Depuis l'installation initial, j'ai upgrade de 1.24 -> 1.25 -> 1.26, sans trop de probleme. Le seul hic qui pourrait etre mieux pris en compte est un meilleur logging lors d'un upgrade. Un PDB peut entrainer un erreur d'upgrade d'une node.

```bash
NAME      STATUS   ROLES           AGE    VERSION       INTERNAL-IP     EXTERNAL-IP   OS-IMAGE                         KERNEL-VERSION    CONTAINER-RUNTIME
ctrl-01   Ready    control-plane   138d   v1.26.0+k0s   192.168.86.20   <none>        Debian GNU/Linux 11 (bullseye)   5.10.0-21-amd64   containerd://1.6.15
wrk-01    Ready    <none>          138d   v1.26.0+k0s   192.168.86.21   <none>        Debian GNU/Linux 11 (bullseye)   5.10.0-21-amd64   containerd://1.6.15
wrk-02    Ready    <none>          138d   v1.26.0+k0s   192.168.86.22   <none>        Debian GNU/Linux 11 (bullseye)   5.10.0-21-amd64   containerd://1.6.15
wrk-03    Ready    <none>          138d   v1.26.0+k0s   192.168.86.23   <none>        Debian GNU/Linux 11 (bullseye)   5.10.0-21-amd64   containerd://1.6.15

```

Note final: 3.5/5
