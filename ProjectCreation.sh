#!/bin/bash
#user password parameter to avoid user password prompt
mypassword=$1

#Repository URL
git_URL="https://github.com/soulkanarprograms/DevOps.git"

#If mypassword is set then do not ask for pasword in prompt command
if [ -z '$mypassword' ] ; then

	echo $mypassword | sudo -

	#Epel-Release Repository Installation
	yum install -y epel-release 

	#Ansible Installation
	yum install -y ansible

	#Git Installation
	yum install git -y

else

	#Epel-Release Repository Installation
	sudo yum install -y epel-release 

	#Ansible Installation	
	sudo yum install -y ansible

	#Git Installation	
	sudo yum install git -y

fi

#Clone Git Repository
git clone $git_URL

#Execute Ansible host_playbook
sudo ansible-playbook -i inventory_hostbase $PWD/DevOps/infra/site.yml --connection=local
