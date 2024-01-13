### Module `shutil`

`shutil` peut venir en complément de `pathlib`, il propose des opérations de haut-niveau sur les fichiers et répertoires, notamment pour les copies, les déplacements et la suppression.

On trouve ainsi une fonction `copy` qui permet de copier un fichier à un autre endroit sur le système.
La fonction prend en arguments le chemin source et sa destination, les chaînes de caractères et les objets `Path` sont acceptés.  
Elle renvoie le chemin du fichier copié.

```pycon
>>> from pathlib import Path
>>> import shutil
>>> shutil.copy(Path('hello.txt'), 'new.txt')
'new.txt'
>>> Path('new.txt').read_text()
'salut\n'
```

Il est aussi possible de préciser un répertoire en second argument pour copier le fichier (en conservant son nom) vers ce répertoire.

```pycon
>>> shutil.copy('hello.txt', 'subdir')
'subdir/hello.txt'
>>> Path('subdir/hello.txt').read_text()
'salut\n'
```

Pour copier des arborescences de fichiers (fichiers et répertoires), `shutil` propose une fonction `copytree` sur le même principe que `copy`.
La fonction copie récursivement le répertoire source et les fichiers qu'il contient vers la destination.

```pycon
>>> shutil.copytree('subdir', 'newdir')
'newdir'
>>> list(Path('newdir').iterdir())
[PosixPath('newdir/hello.txt'), PosixPath('newdir/file.py')]
```

De la même manière, on trouve une fonction `move` pour déplacer un fichier ou un répertoire vers une destination.

```pycon
>>> shutil.move('new.txt', 'moved.txt')
'moved.txt'
>>> Path('moved.txt').read_text()
'salut\n'
>>> Path('new.txt').exists()
False
>>> shutil.move('newdir', 'moveddir')
'moveddir'
>>> list(Path('moveddir').iterdir())
[PosixPath('moveddir/hello.txt'), PosixPath('moveddir/file.py')]
>>> Path('newdir').exists()
False
```

Et le module offre aussi une fonction `rmtree` pour supprimer récursivement un répertoire.

```pycon
>>> shutil.rmtree('moveddir')
>>> Path('moveddir').exists()
False
```

Enfin, dans un tout autre genre, la fonction `get_terminal_size` permet de connaître la taille (en lignes de caractères et en colonnes) du terminal.
La fonction renvoie un tuple nommé avec deux champs `columns` et `lines`.

```pycon
>>> shutil.get_terminal_size()
os.terminal_size(columns=136, lines=66)
```

La [page de documentation de `shutil`](https://docs.python.org/fr/3/library/shutil.html) complètera les informations au sujet de ce module.
