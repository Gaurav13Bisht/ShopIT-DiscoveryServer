FROM openjdk:17
EXPOSE 8080
ADD target/shopit-discovery-server-1.0-SNAPSHOT.jar shopit-discovery-server-1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/shopit-discovery-server-1.0-SNAPSHOT.jar"]