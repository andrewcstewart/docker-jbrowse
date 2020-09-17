[![Stories in Ready](https://badge.waffle.io/andrewcstewart/docker-jbrowse.png?label=ready&title=Ready)](https://waffle.io/andrewcstewart/docker-jbrowse)
##docker-jbrowse##
==============

**[Docker](https://www.docker.com/) recipe for JBrowse**

#Getting up and running:

**Make sure you have [Docker installed](https://docs.docker.com/installation/ubuntulinux/).**
```
$ docker info
```
 
**Build the image using the `docker` daemon:**
```
$ docker build -t docker-jbrowse .
```

**Run the image**
```
$ docker run -it --name jbrowse -p 8080:80 docker-jbrowse
```

##OR

**Build and run `dockerjbrowse` using `docker-compose`:**
```
$ sudo pip install docker-compose
$ docker-compose up
```

**Access JBrowse on DOCKER_IP:8080, type `$ ip add | grep docker`:**

     `http://172.17.X.X:8080`