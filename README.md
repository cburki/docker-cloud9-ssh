Summary
-------

*Cloud9 Remote SSH Workspace* image. It allow to run a cloud9 ssh workspace
to work on your projects remotely. See [Setting Up an SSH Workspace](https://docs.c9.io/docs/running-your-own-ssh-workspace)
in the cloud9 documentation. The cloud9 installation script is automatically
installed and executed during the first run of the image. This script install
a few things necessary to give your terminal access from cloud9.


Build the image
---------------

To create this image, execute the following command in the docker-sshd folder.

    docker image build -t cburki/cloud9-ssh .


Configure the image
-------------------

The following environment variables could be used to configure the users.

 - SSH_PASSWORD : The password for root and given user. No password is set when not specified.
 - SSH_AUTHORIZED_KEY : Your public key that will be added to the authorized key file of the root and given user.
 - SSH_USER : An optional user that will be created.
 
You will not be able to log into this container if you do not provide at
least SSH_PASSWORD or SSH_AUTHORIZED_KEY. Be careful to set a strong password
for the users because they have full access to the volumes you specify to mount
when running the container. When he user SSH_USER is created, the SSH_PASSWORD
and SSH_AUTHORIZED_KEY are also set for this user.


Run the image
-------------

When you run the image, you will bind the SSH port 22. This port will be used
during the creation of your cloud9 remote ssh workspace explained [here](https://docs.c9.io/docs/running-your-own-ssh-workspace#section-creating-an-ssh-workspace).
You can bind aditional ports that is requested by your environment (i.e. a http
port to test your web application).

    docker container run \
        --name cloud9-workspace \
        -d \
        -e SSH_PASSWORD=<your_password> \
        -e SSH_AUTHORIZED_KEY="<your_key>" \
        -p <ssh_external_port>:22 \
        cburki/cloud9-ssh:latest

You can add volumes with the projects data you would like to work on.
