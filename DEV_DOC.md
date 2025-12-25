This document is a developer document to explain all things from a dev perspective.

1. First thing were gonna talk about how to set up the environment from the start, in a sort of step by step tutorial (sort of):

Were gonna start with mariadb, for mariadb and all the other containers we need a Dockerfile first to create our isolated container.

in this Dockerfile all the others we start by pulling the debian image from docker hub using FROM after that we use RUN utility to write down the commands needed to install all the dependencies need to run mariadb the other things is to configure mariadb using the config file to be able to use the port we need and of-course to connect it later with wordpress via nginx,

as for creating our database we gonna do that using a script via the mariadbd tool using mysql script and of-course we gonna need to copy both the script and config file to there needed position for them to take affect, i used entrypoint in the main containers because the main use of it is to run the script as a main process there for we gonna have its pid to start and stop as we need, cmd will work to but its not used for the thing we need which is running the container process as a main process and for it to run in the foreground, will these step i gave you to follow for setting up mariadb are kinda the same for all the other ones we gonna need a config file and in some-cases like in nginx were not gonna even need a script for we don't have any use for it, so its essential all our containers have there own Dockerfile that will run them in there isolated container, after following these steps to build our containers we gonna need a docker compose file,

think of it like a makefile helping us to run all the container in parallel and using the network feature will nut them all in the same bridge mode network, using docker compose file we gonna customize our containers to run in certain ports or expose there ports to other container, we gonna add volumes that are mounted in bind mount which mean we gonna use our own volumes from the local host, in dockerfile we gonna do an assortment of things like naming our containers, make it so it restarts in case of failure and more things.

2. Now were gonna talk about building and running the containers using makefile and docker compose, and some useful commands:

"*". To build the containers and run them you can type the command "make up", make up uses the command docker compose up plus the --build flag which rebuilds very thing instead of just running the containers.

"**". To stop all containers for this environment run "make stop" or "make down" to stop and removed them, which uses the command docker compose down -v which stops and removes all containers run by docker compose, the -v is for unmounting the volumes.

"***". To run containers that you stopped using make stop just run "make start", which runs the command docker compose stop.

"****". To check the status of all running containers just run "make status", which runs the command docker ps that list all running containers, there docker ps -a, another useful command for listing containers that ran previously.

"*****". another useful command would be the ones for listing all images which is "docker image ls" and the one for printing the logs file "docker compose logs" (in make file write make logs).

"******". These commands i like they for deleting images "docker image prune -all", for deleting containers "docker container prune -f".

3. Lastly were gonna talk about volumes, how to access them:

you can access the local volumes in /home/ybenchel/data/, there you will find the local bind mount volumes, wordpress and mariadb, they have all thing the mariadb and wordpress container made, adding something there will effect the containers volume because they are mounted.

we of-course mounted them using docker compose features and we specified them to be of type local and the format be none (it can be nfs or fat or whatever), and we specified were the path will be.