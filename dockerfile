#Install ubuntu Image
FROM ubuntu:24.10
RUN mkdir MCServer
RUN apt-get update
RUN apt install openjdk-21-jdk-headless -y
RUN apt install openjdk-8-jdk-headless -y
RUN apt-get install nano
RUN apt-get install wget -y
##Download Server Jar file and load EULA into server Directory 
WORKDIR /MCServer
COPY /Output/Eula.txt /MCServer/
RUN wget https://piston-data.mojang.com/v1/objects/59353fb40c36d304f2035d51e7d6e6baa98dc05c/server.jar
RUN java -jar server.jar --nogui --Xmx8G -Xms2G -XX:+UnlockExperimentalVMOptions -XX:+UseZGC