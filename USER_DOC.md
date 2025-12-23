This file is a user documentation made to make it easier for a user to understand whats provided here by this stack.

First of all, we gonna start by explaining what are the services provided here, the main 3 here are mariadb nginx and wordpress, your gonna find all of them inside the requirements folder that is inside the srcs folder, so as you probably noticed by now these 3 service are made to run a wordpress website with our own mariadb databases on our configured nginx webserv so by the end of it you gonna be able to configure all this 3 parts and access a admin user page in wordpress to have more control of it all, plus in the bonus side we have another 4 additional servers, ftp for file transfer (i use filezilla to transfer files from the container to our host machine and vise versa), redis which is used for caching web pages, reducing load on servers and improving page loading times, glances which is like an htop but has a web interface, adminer which is a web interface used for managing databases easily, and another added in the bonus, a simple webpage that i host in the same domain as the wordpress one.

Now lets talk about how to run the project, were gonna use makefile for that first:
1. To build the containers and run them you can type the command "make up".
2. To stop all containers for this environment run "make stop" or "make down" to stop and removed them.
3. To run containers that you stopped using make stop just run "make start".
4. To check the status of all running containers just run "make status".


Next were gonna talk about "Accessing the website and the administration panel":
To do that you can just type in the browser https://ybenchel.42.fr/ after running the make up of-course, as for accessing the admin panel just add /wp-admin to the end of the url, your gonna be promoted to inter a user name and password your gonna find those in the .env file.

Lets talk about "Locating and managing credentials":
all credentials will be found in the .env file, the mariadb, wordpress and all the other there you can change what you need to change and modify as you wish because its an environment variable file, your changes will be updated automatically.

As for "Checking that the services are running correctly":
after running "make up", just run "make status" to which runs the command docker ps that is gonna display a list of running containers, and will show all needed infos to make sure all containers are running correctly, if a container is missing you can run "make logs" which gonna run the command "docker compose logs" to print the logs files, so you can see if something unusual happened.