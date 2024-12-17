# Minecraft Docker Project
## About the project
    The docker image file is built using the ubuntu 24.10 version as the OS Base
    The Minecraft server is running version 1.21.1
    I undertook this project as an effort for my Systems administration class in college, it may not be the best at the moment but, it functions well enough and will be worked on as I continue to learn more.
## How I created the Image File
### Prep work
    To begin we must first understand what the requirements for a Minecraft server are. These requirements can be found on the Minecraft Wiki. These requirements will vary depending on the OS being used and the desired player count. For our use case we will require 2GB of ram. Keep this in mind as this will be important later. We also will need to create a text file called “eula.txt” and inside of it enter the text eula=true. Add that txt file into an Output folder. This will allow the dockerfile to begin running the server without hangups or user input. Addtionally to save time I took a server.properties file. That one will also be copied.
    we will modify to the server config file to the following values
    “difficulty=easy” to “difficulty=hard”
    “motd=A Minecraft Server” to “motd=Hello there!”
    “level-type=minecraft\:normal” to level-type=minecraft\:large_biomes
    Then in the docker file I input the following information
        FROM ubuntu:24.10
        ENV DEBIAN_FRONTEND=noninteractive
        RUN mkdir MCServer
        RUN apt-get update
### Required Packages
    I used the RUN command during building withto download the following packages, this will help us make any edits to files if needed.
        RUN apt install openjdk-21-jdk-headless -y
        RUN apt install openjdk-8-jdk-headless -y
        RUN apt-get install nano
        RUN apt-get install wget -y
### Downloading and Loading Critical Files
    The Following commands will create the directory for the server files, download the server.jar file and then we copy the server.properties file and the eula.txt file mentioned at the begining, we create a volume for persistent storage in case we have to reboot or shutdown the container and lastly expose the ports required for the container to accept connections.
        WORKDIR /MCServer
        COPY /Output/server.properties /MCServer/
        COPY /Output/eula.txt /MCServer/
        RUN wget https://piston-data.mojang.com/v1/objects/59353fb40c36d304f2035d51e7d6e6baa98dc05c/server.jar
        VOLUME /MCServer /MCServer
        EXPOSE 25565
### Finishing Touch
    Lastly enter the following line at the end of the docker file
        CMD java -Xmx2G -Xms4G -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -jar server.jar
    This will run the minecraft server for us using 2GB of ram dedicated to the server and set a max ram usage of 4.
## Creating the Docker Compose File