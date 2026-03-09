# 📘 USER_DOC.md — Guide utilisateur du projet Inception

Pour utiliser le projet Inception, vous pouvez gérer tous les services Docker via le Makefile fourni. Pour démarrer l’infrastructure complète, incluant NGINX, WordPress et MariaDB, utilisez la commande `make ` depuis la racine du projet. Cette commande construit toutes les images Docker définies dans les Dockerfile, crée les conteneurs, configure les réseaux et monte les volumes pour persister les données, puis lance les services en arrière-plan. 

Si vous souhaitez seulement démarrer les services existants sans reconstruire les images, utilisez `make up`. 

Pour redémarrer rapidement les services en cours d’exécution, la commande `make restart` relance tous les conteneurs.

Pour arrêter les services, `make down` arrête tous les conteneurs mais conserve les volumes afin que les données de WordPress et de MariaDB ne soient pas perdues. 

Si vous voulez effectuer un nettoyage complet, incluant la suppression des conteneurs, des volumes, des images et des conteneurs orphelins, utilisez `make fclean`.

