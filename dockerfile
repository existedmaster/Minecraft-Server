#Install ubuntu Image
FROM ubuntu:24.10
RUN mkdir MCServer
RUN apt-get update
#Installs the dependencies required to run the server and to edit files
RUN apt install openjdk-21-jdk-headless -y
RUN apt install openjdk-8-jdk-headless -y
RUN apt-get install nano
RUN apt-get install wget -y
VOLUME /MCServer
##Download Server Jar file and load EULA into server Directory 
WORKDIR /MCServer
COPY /Output/eula.txt /MCServer/
RUN wget https://piston-data.mojang.com/v1/objects/59353fb40c36d304f2035d51e7d6e6baa98dc05c/server.jar
EXPOSE 25565
#CMD java -Xmx2G -Xms2G -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -jar server.jar --nogui
CMD exec shell