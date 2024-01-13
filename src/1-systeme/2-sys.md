### Module `sys`

`sys` est un module qui fournit différentes informations sur le système d'exploitation et l'interpréteur Python.

On trouve notamment des attributs `platform`, `version` et `version_info` pour connaître l'OS utilisé et la version de Python.

```pycon
>>> import sys
>>> sys.platform
'linux'
>>> sys.version
'3.9.7 (default, Aug 31 2021, 13:28:12) \n[GCC 11.1.0]'
>>> sys.version_info
sys.version_info(major=3, minor=9, micro=7, releaselevel='final', serial=0)
>>> sys.version_info.major, sys.version_info.minor
(3, 9)
```

On peut aussi accéder au chemin de l'exécutable Python (`executable`), ainsi qu'à la liste des arguments du programme (`argv`).

```pycon
>>> sys.executable
'/usr/bin/python'
>>> sys.argv
['']
```

Le module met à disposition les fichiers `stdin`, `stdout` et `stderr` qui sont liés respectivement à l'entrée standard, la sortie standard et la sortie d'erreur.

```pycon
>>> sys.stdin.readline()
hello
'hello\n'
>>> sys.stdout.write('coucou\n')
coucou
7
>>> sys.stderr.write('error\n')
error
6
```

Le dictionnaire `modules` référence tous les modules importés au sein de l'interpréteur.
C'est un mécanisme de cache au sein de Python pour éviter de charger plusieurs fois un même module.

```pycon
>>> sys.modules
{'sys': <module 'sys' (built-in)>, 'builtins': <module 'builtins' (built-in)>, ...}
>>> sys.modules['sys']
<module 'sys' (built-in)>
>>> sys.modules['sys'].platform
'linux'
```

Quand je vous parlais de récursivité, j'évoquais une limite au nombre de récursions autorisées par l'interpréteur Python.
Cette limite peut être connue via un appel à la fonction `getrecursionlimit` du module `sys`.

```pycon
>>> sys.getrecursionlimit()
1000
```

Enfin, nous l'avons déjà rencontrée, la fonction `exit` permet de couper le programme en cours d'exécution.
Utilisée sans argument, la fonction coupe le programme normalement avec un code de retour de 0 (signifiant que tout s'est bien passé).

```pycon
>>> sys.exit()
% echo $?
0
```

Avec un nombre en argument, c'est ce nombre qui sera utilisé comme code de retour (un code de retour différent de 0 signifie que le programme s'est terminé sur une erreur).

```pycon
>>> sys.exit(12)
% echo $?
12
```

Avec une chaîne de caractères en argument, la chaîne sera écrite sur la sortie d'erreur et le code de retour sera 1.

```pycon
>>> sys.exit('error')
error
% echo $?
1
```

L'ensemble de ces fonctions, et bien d'autres encore, peut être retrouvé sur [la page de documentation du module `sys`](https://docs.python.org/fr/3/library/sys.html).
