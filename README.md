This project has been created as part of the 42 curriculum by ybenchel


Description:

Inception is a project made to make students of 42 network familiar with the concepts of containerization (the ops in Devops), This project asks us to establish a bunch of containers that run in parallel using docker
to build a WordPress website with its own mariadb database and an nginx webserv, as i said this project uses docker and there for were gonna be familiar with most things docker by the end of this project from dockerfiles
to docker compose to PID 1 and containers as a concept.

Instructions:

The starting process is very straight forward, Just as in previous projects just use make in this sequence:
1. To build the containers and run them you can type the command "make up".
2. To stop all containers for this envirement run "make stop" or "make down" to stop and removed them.
3. To run containers that you stoped using make stop just run "make start".
4. To check the status of all running containers just run "make status".

Resources:

For the resources i used for this project these are a few of them, Since i didnt rely on one or two things for the whole project:

1. This article right here byyoussef is very useful to get most of the needed infos to the start the project like what is a container what is docker etc https://medium.com/@imyzf/inception-3979046d90a0.
2. This one is very helpful to learn containerization by the details the how and why of it, its very helpfull https://iximiuz.com/en/posts/container-learning-path/.

Project description:

    1. Virtual Machines vs Docker:
    First, of course, the difference lies in the fact that Docker is a tool designed to allow us to build, deploy, and run applications in an isolated space.
    Unlike virtual machines, which are more than a tool, they are software made to virtualize everything an OS needs to run, meaning virtualizing the hardware that the OS is going to use.
    This is done with a hypervisor, which manages the hardware needed for all virtual machines to run in their own isolated space.
    Unlike containers, such as those in Docker, which need an existing OS to run, they are lightweight and only use the bare minimum from the kernel while containing all the dependencies and code the application needs to run.
    
    2. Secrets vs Environment Variables:
    The main difference is that secrets are designed for sensitive data, such as passwords, because they encrypt data at rest and in transit, unlike environment variables, which are intended for non-sensitive data.

    3.  Docker Network vs Host Network: (lol)
    Docker network (Bridge) is an isolated network requiring port mapping, while the host network makes containers share the hosts network directly therefore reducing isolation.

