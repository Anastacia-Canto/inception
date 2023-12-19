
# Inception

Just imagine you have an application that you want to deploy in a controlled environment to test. You can do this with a virtual machine? Yes! But sometimes the time and complexity to create and setup a virtual machine can be complicated. 
And so we have a simpler way to do that: Docker!

Actually Docker is an open-source platform that allows developers to package software into containers. Docker is a tool for creating and managing containers!
With containers we can easily create an isolated environment without all the complication of virtual machines. It creates kind of process that make a virtualization at the operating system level providing a system logically isolated from other applications. 

All you need is a document with the specific dependencies of your application. It is called Dockerfile. Docker engine will read this document, and install all you need using Docker images! The images can be pulled from known repositories or customized, which is the case of Inception 42 project. And with one command line and few minutes you can build your application in any computer!

Inception is a project proposed by 42 curriculum to allow students to explore and experiment a little of what Docker is capable of. In this project we've created 3 different containers with customized Docker Images, one with NGINX, other with MariaDB and the last with Wordpress. The objective is run a Wordpress page, with NGINX as server, controlling the requests for a specific domain, and persisting data on a database using Docker Volumes to store data locally. The communication between containers is managed by Docker Network through designed ports. The process of reading Dockerfiles, creating the images and building the application is done with a unique command using Docker Compose. 

It was an incredible opportunity to know this tool that has become such an important tool on developers routine!

## Resources

- [Docker Tutorial for beginners](https://docker-curriculum.com/)
- [Tutorial for Inception 42](https://tuto.grademe.fr/inception/)
- [Tutorial Docker Compose](https://docs.docker.com/compose/gettingstarted/)
- [More about Docker Compose](https://www.techrepublic.com/article/how-to-build-a-docker-compose-file/)
- [NGINX Configuration](https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms)
