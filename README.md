# ECF-Back---Part-1---Projet-biblioth-que---BDD
Base de donnée pour le projet bibliothèque
## Prérequis

- MariaDB
- PHPMyAdmin
# Installation depuis PHPMYADMIN
Depuis l'interface phpmyadmin cliqué sur nouvelle base de donnée à gauche, donné un nom à votre base de donnée (le nom importe peu il sera à configurer dans symfony)
cliqué sur la base de donnée que vous avez créée, privilège, ajouter un compte utilisateur, créer votre compte.
pour finir cliqué sur votre base de donnée, importé et choisissé le fichier ecfsymfony.sql présent dans le dépôt.

# Installation depuis le terminal mysql

 - Se connecté à l'interface mysql avec les lignes de commande suivant (u étant l'utilisateur et p le mot de passe, par exemple mysql -u admin -ppassword)
```shell
mysql -u root -p
```
- Créer la base de donnée (vous pouvez lui donné le nom que vous souhaitez ça n'a pas d'importance, ça sera à configurer dans symfony)
```shell
CREATE DATABASE nom_de_la_base_de_donnees;
````
- Créer l'utilisateur
```shell
CREATE USER 'votre_utilisateur'@'localhost' IDENTIFIED BY 'votre_mot_de_passe';
```
- Accorder les privilèges à la base de données créée, ATTENTION : l'utilisation de .* est très importante pour accéder à l'intégralité des données.
```shell
GRANT ALL PRIVILEGES ON votre_base_de_donnees.* TO 'votre_utilisateur'@'localhost';
```
- Maintenant il faut rafraichir les données, pour que les paramètres soit pris en compte avec la commande: 
```shell
FLUSH PRIVILEGES;
```

# importation de la base de donnée
- importer le fichier ecfsymfony.sql dans le dépôt, en cliquant sur la base de donnée et importer dans la barre du haut.
- Pour finir vous pouvez importer le fichier add-random-info.sql pour ajouté les données de test. (Dans l'ecf 3 j'ai également les données directement avec faker, j'avais envie de savoir comment faire avec les deux méthodes, vous pouvez donc vous reporter à l'ecf 3 pour la méthode faker)
