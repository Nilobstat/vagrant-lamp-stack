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

Les comptes mysql créés sont:
	user: root
	password: root

	user: user
	password: user

