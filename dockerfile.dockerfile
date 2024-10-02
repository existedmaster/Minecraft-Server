#Install ubuntu Image
FROM ubuntu:24.10
RUN mkdir MCServer
RUN apt-get update
RUN apt-get install wget
##Download Server Jar file into server Directory 
WORKDIR /MCServer
RUN wget https://piston-data.mojang.com/v1/objects/59353fb40c36d304f2035d51e7d6e6baa98dc05c/server.jar
