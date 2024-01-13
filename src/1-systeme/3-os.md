### Module `os`

`os` est l'interface bas-niveau du système d'exploitation (_os_ pour _operating system_), le module offre une multitude de fonctions pour communiquer avec lui.

On trouve notamment des fonctions pour manipuler les fichiers et répertoires telles que `mkdir`, `rmdir`, `unlink`, `open`, etc.
Ces fonctions sont celles qui sont utilisées par la `pathlib` qui leur ajoute une interface plus haut-niveau pour manipuler ces données.

La plupart des fonctions exposées dans `os` sont d'ailleurs abstraites dans d'autres modules (`subprocess`, `shutil`) pour les rendre plus faciles à utiliser.

[[i]]
| De la même manière, on trouve le module `os.path`, antérieur à la `pathlib`, pour gérer les chemins de fichiers avec des fonctions comme `exists`, `dirname`, `basename` ou encore `splitext`.

Le module propose aussi une fonction `chdir` (pour _change directory_) qui prend un chemin (relatif ou absolu) en argument et permet de changer le répertoire courant.

```pycon
>>> Path.cwd()
PosixPath('/home/antoine')
>>> os.chdir('..')
>>> Path.cwd()
PosixPath('/home')
```

[[a]]
| Attention, changer de répertoire courant affecte ensuite toutes les opérations utilisant des chemins relatifs, c'est une opération à réaliser avec précaution.

Parmi les autres outils présents dans le module, on trouve par exemple la fonction `cpu_count` qui permet de savoir combien de cœurs sont disponibles sur la machine.

```pycon
>>> os.cpu_count()
8
```

##### Gestion de l'environnement

Un programme est toujours exécuté dans un certain environnement.
Cet environnement consiste en un ensemble de variables définies par le système, sur lesquelles les programmes peuvent se baser pour certaines de leurs actions.  
Il est ainsi courant de trouver des variables d'environnement telles que `SHELL` (le shell utilisé), `USER` (l'utilisateur courant), `LANG` (la langue de l'utilisateur), `HOME` (le dossier de l'utilisateur) ou `PWD` (le répertoire courant).

Depuis le shell, on peut spécifier des variables d'environnement supplémentaires pour un programme en plaçant `VAR=value` avant l'invocation du programme.

```shell
% OUTPUT=/tmp/out MAX_VALUE=256 python script.py
```

[[i]]
| Il est coutume d'utiliser exclusivement des lettres capitales (ainsi que des chiffres et des _underscores_) dans les noms de variables d'environnement.

En Python, l'environnement est accessible via le dictionnaire `environ` du module `os`.
Ce dictionnaire associe les valeurs des variables d'environnement à leurs noms.

```pycon
>>> import os
>>> os.environ
environ({..., 'OUTPUT': '/tmp/out', 'MAX_VALUE': '256'})
```

On le voit, les valeurs des variables d'environnement sont toujours des chaînes de caractères, il peut alors être nécessaire de les convertir.

```pycon
>>> os.environ['MAX_VALUE']
'256'
>>> int(os.environ['MAX_VALUE'])
256
```

Le module dispose aussi d'une fonction `getenv` pour récupérer une variable d'environnement.

```pycon
>>> os.getenv('OUTPUT')
'/tmp/out'
```

La fonction renvoie `None` si la variable d'environnement n'est pas définie, mais il est possible de lui spécifier un argument `default` pour choisir cette valeur par défaut.

```pycon
>>> os.getenv('NOTFOUND')
>>> os.getenv('NOTFOUND', 'no')
'no'
```

Le dictionnaire `environ` est bien sûr éditable, ce qui permet de faire évoluer l'environnement du programme.

```pycon
>>> os.environ['MAX_VALUE'] = str(int(os.environ['MAX_VALUE']) * 2)
>>> os.getenv('MAX_VALUE')
'512'
```

Afin de traiter l'environnement comme des chaînes d'octets, on trouve aussi le dictionnaire `environb` et la fonction `getenvb` qui remplissent le même rôle que `environ` et `getenv`.

```pycon
>>> os.environb
environ({..., b'OUTPUT': b'/tmp/out', b'MAX_VALUE': b'512'})
>>> os.getenvb(b'MAX_VALUE')
b'512'
```

Pour plus d'informations, vous pouvez consulter [la documentation du module `os`](https://docs.python.org/fr/3/library/os.html).
