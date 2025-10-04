+++
date = 2025-01-23T02:27:33Z
description = ""
draft = false
cover = "/posts/2025/01/img-Vi1SLlzES3vyYMqFo3FGXlI2.png"
slug = "intel-cpu-throttling"
title = "Intel CPU throttling"

+++


Pour la travail j'ai un laptop DELL. Celui-ci n'aime vraiment pas quand j'utilise une power source inférieur a 65W. Dans ce cas, le CPU est ralentie au maxxxiiimmuuummm. J'ai l'impression d'avoir un 386. Après plusieurs essaie infructueuse, la solution consiste a désactiver un module du kernel (Running Average Power Limit):

sudo rmmod intel_rapl_msr
