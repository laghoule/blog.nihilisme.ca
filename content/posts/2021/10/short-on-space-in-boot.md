+++
categories = ["technologie", "Import 2023-04-08 17:32"]
date = 2021-10-15T01:12:42Z
description = "No space left on /boot"
draft = false
cover = "/posts/2021/10/heather-gill-6Bo-eIl7390-unsplash.jpg"
slug = "short-on-space-in-boot"
tags = ["technologie", "Import 2023-04-08 17:32"]
title = "Short on space in /boot?"

+++


Edit /etc/initramfs-tools/initramfs.conf (Debian) and replace `MODULES=dep` with `MODULES=dep`. This will reduce the size of the initrd.img image by guessing modules to include.

```text
#
# MODULES: [ most | netboot | dep | list ]
#
# most - Add most filesystem and all harddrive drivers.
#
# dep - Try and guess which modules to load.
#
# netboot - Add the base modules, network modules, but skip block devices.
#
# list - Only include modules from the 'additional modules' list
#

MODULES=dep

```

_PS: Use at your own risk_
