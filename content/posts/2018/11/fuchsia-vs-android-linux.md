+++
categories = ["technologie"]
date = 2018-11-24T02:38:57Z
description = ""
draft = false
cover = "/posts/2018/11/Fuchsia-os.png"
slug = "fuchsia-vs-android-linux"
tags = ["technologie"]
title = "Fuchsia VS Android/Linux"

+++

Pourquoi Google developpe Fuchsia? Pour plusieurs raisons et voici selon moi les motivations:

Securite: Linux contient des dixaines de millions de lignes de codes. Plus de codes, plus de bugs. Une fraction de ces lignes de codes est vraiment necessaires pour un systeme embarque comme un telephone, tablette ou autres.

Controle: Linux est dirige par un systeme de mainteneurs, et le grand boss est Linus Torvald. Google doit passer par les memes procedures que les autres pour l'inclusion de nouveaux codes, et il doit se conformer aux directives demande par les mainteneurs et Linus au final. Android est donc un fork du kernel, et c'est un travails de longue halleine d'etre "in-sync" avec le mainline kernel.

Technologie: Micro-kernel VS Monolithique, vieux debats. Aujourd'hui les CPU/RAM/BUS sont tellement plus puissant et rapide qu'en 1993, que les penalites de performances des micro-kernel n'est plus un point valide.
