Utilisation:
------------

Cloner le dépot à la racine du projet

	git clone https://github.com/Nilobstat/vagrant-lamp-stack.git vagrant

lancer la machine virtuelle:

	cd vagrant
	vagrant up

Le serveur web est configuré pour servir le dossier parent du dossier vagrant.
Le site servi est accessible à l'adresse

	http://localhost:8888

Il est possible d'accéder à la machine virtuelle via ssh

	vagrant ssh

Le script static.sql crée une base de données nommée "application" dans la machine
virtuelle, ainsi qu'un utilisateur nommé "user" ayant accès à cette dernière.
Les mots de passe des comptes mysql créés sont:

	user: root
	password: root

	user: user
	password: user

Le script dump.sql est éxécuté après static.sql, il est destiné à provisionner la
base de données avec les données utilisées pendant le dévelopement.
Pour écrire dans ce script, depuis la machine virtuelle.

	sudo su
	mysqldump -uroot -p application > /vagrant/webroot/vagrant/dump.sql
