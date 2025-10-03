+++
categories = ["coding", "projet", "technologie", "Import 2023-04-08 17:32"]
date = 2020-05-17T02:11:31Z
description = ""
draft = false
image = "__GHOST_URL__/content/images/2020/05/external-content.duckduckgo.com.png"
slug = "support-de-rancheros-pour-kured"
tags = ["coding", "projet", "technologie", "Import 2023-04-08 17:32"]
title = "Support de RancherOS pour Kured"

+++


Pour ceux qui utilisent RKE/RancherOS pour leur cluster Kubernetes, j'ai de quoi pour vous. Un patch a Kured qui permet de gerer les updates de RancherOS de facon securitaire.

{{< bookmark url="https://github.com/laghoule/kured" title="laghoule/kured" description="Kubernetes Reboot Daemon. Contribute to laghoule/kured development by creating an account on GitHub." icon="https://github.githubassets.com/favicons/favicon.svg" author="laghoule" publisher="GitHub" thumbnail="https://avatars3.githubusercontent.com/u/1598055?s=400&v=4" caption="" >}}

Comment ca fonctionne? Voici une config cloud-init pour updater et rebooter un node:

```yaml
write_files:
  # Script to upgrade image OS if available (no reboot)
  # Reboot is handled by K8S kured daemonset
  - path: /var/lib/rancher/os-updater.sh
    permissions: "0755"
    owner: root
    content: |
      #!/bin/sh

      source /usr/share/ros/os-release

      STATUS=0
      OS_LOCATION=`sudo ros os list | head -n1 | awk {'print $2'}`
      OS_VERSION=`sudo ros os list | head -n1 | awk {'print $1'} | cut -d : -f 2`

      if [ "$OS_LOCATION" == "local" ] && [ "$OS_VERSION" != "$VERSION" ]; then
        echo "Upgrade available"
        sudo ros os upgrade -f --no-reboot &>> /var/log/os-updater.log
        STATUS=$?
        if [ $STATUS -eq 0 ]; then
          sudo touch /var/lib/rancher/update/need_to_reboot
        else
          echo "Upgrade failed"
        fi
      else
        echo "No upgrade available"
      fi

      exit $STATUS

  # Check if it's a good time to reboot
  - path: /var/lib/rancher/os-rebooter.sh
    permissions: "0755"
    owner: root
    content: |
      #!/bin/sh
      if [ -f /var/lib/rancher/update/reboot_now ] && [ -f /var/lib/rancher/update/need_to_reboot ]; then
        sudo rm /var/lib/rancher/update/need_to_reboot
        sudo rm /var/lib/rancher/update/reboot_now
        sudo reboot
      fi

# Rancher cronjob
rancher:
  services:
    # os-updater CRONJOB @hourly
    os-updater:
      image: rancher/os-base:v1.5.5
      command: /var/lib/rancher/os-updater.sh
      labels:
        io.rancher.os.scope: "system"
        cron.schedule: "0 0 * * * ?"
      pid: host
      privileged: true
      volumes_from:
        - all-volumes
    # os-rebooter CRONJOB @minute
    os-rebooter:
      image: rancher/os-base:v1.5.5
      command: /var/lib/rancher/os-rebooter.sh
      labels:
        io.rancher.os.scope: "system"
        cron.schedule: "0 * * * * ?"
      pid: host
      privileged: true
      volumes_from:
        - all-volumes
```

Par la suite, avec mon fork de Kured, si le fichier --reboot-sentinel existe, il creera le fichier --host-sentinel, qui lui sera gerer par la cronjob systeme `os-rebooter`.

Voila, vos clusters auront toujours un version a jour de RancherOS.

