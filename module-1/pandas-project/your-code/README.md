# Pandas project



## Nettoyage des données

J'ai commencé par importer le fichier CSV, puis regarder à quoi il ressemble.

J'ai changé le nom des colonnes.


### Colonnes inutiles

Je regarde le nombre de données nulles dans chaque colonne, et je supprime celles qui sont présentes en double/ inutiles/ trop vides, et les colonnes 'duplicates'.


### Colonne 'Sex'

J'ai fait en sorte que la colonne 'Sex' ne contienne que les données 'F', 'M' et 'UNKNOWN'.


### Colonne 'Victim'

Idem.


### Remplissage des cases vides

Une fois que les cases mal remplies sont vides, je peux toutes les remplir avec celles qui étaient déjà vides par 'UNKNOWN'. Je vérifie ensuite que toutes les cases de la data frame sont remplies.



## Analyse des données


Je ne savais pas comment continuer alors j'ai présenté quelques données, et ça faisait que j'avais besoin de nettoyer les cases plus en profondeur.


### Nombre d'attaques par type d'activité

Fait avec la colonne 'Type'.

Voir l'image "Type.png"


### Sexe des victimes

Fait avec la colonne 'Sexe'.

Voir l'image "Sexe.png"


### Accidents qui se sont passés en France

Fait avec la colonne 'Country'.

Voir l'image "France.png"


### Nombre des accidents dont les blessures ont été mortelles 

Fait avec la colonne 'Fatal'.

J'ai eu besoin de faire un nettoyage de cette colonne pour avoir seulement 'Y', 'N', 'UNKNOWN'.

Voir l'image "Fatal.png"


### Nombre de victimes par age

Fait avec la colonne 'Age'.

J'ai fait un gros nettoyage de la colonne 'Age'. Je sais qu'il n'est pas parfait.

Pour nettoyer, je n'ai gardé dans les cases que les données numériques, puis j'ai créé une suite d'exécutions qui fait la moyennes des âges lorsqu'il y en a plusieurs dans une même case.

J'ai ensuite présenté le nombre de victimes par ages dans une DF, puis dans un diagramme en bâtons, parce que j'étais contente d'avoir réussi, j'ai voulu en faire plus.

Voir l'image "Age.png"


