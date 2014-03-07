Utilisation:
------------
Ajouter la box:

	vagrant box add saucy32 http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-i386-virtualbox-puppet.box

La box est référencée par son nom dans Vagrantfile, veiller à nommer la box saucy32
ou modifier son nom dans le Vagrantfile.

Cloner le dépot à la racine du projet

	git clone https://github.com/Nilobstat/vagrant-lamp-stack.git vagrant

Supprimer le dossier .git et le fichier .gitignore

	rm -rf vagrant/.git
	rm -f vagrant/.gitignore

lancer la machine virtuelle:

	cd vagrant
	vagrant up

Le serveur web est configuré pour servir le dossier parent du dossier vagrant.
Le site servi est accessible à l'adresse

	http://localhost:8888

Il est possible d'accéder à la machine virtuelle via ssh

	vagrant ssh

Le script static.sql crée une base de données nommée "application" dans la machine
virtuelle, ainsi qu'un utilisateur nommé "app_user" ayant accès à cette dernière.
Les mots de passe des comptes mysql créés sont:

	user: root
	password: root

	user: app_user
	password: app_user

Le mot de passe root est défini dans le fichier ''modules/mysql//manifests/init.pp''
Les nom et mot de passe de l'utilisateur sont définis dans le fichier ''static.sql''

Le script dump.sql est éxécuté après static.sql, il est destiné à provisionner la
base de données avec les données utilisées pendant le dévelopement.
Pour écrire dans ce script, depuis la machine virtuelle.

	sudo su
	mysqldump -uroot -p application > /vagrant/webroot/vagrant/dump.sql

Un module puppet (https://github.com/tPl0ch/puppet-composer) installe composer.

Troubleshooting
---------------

Si vous rencontrez des problèmes de synchronisation avec les dossiers partagés, (la machine
virtuelle ne voit pas les fichiers contenus dans un dossier), il peut être nécessaire de
recompiler les modules de virtualbox dans la machine virtuelle:

	vagrant ssh
	sudo su
	/etc/init.d/vboxadd setup

Redémarrer ensuite la machine virtuelle:

	vagrant reload
