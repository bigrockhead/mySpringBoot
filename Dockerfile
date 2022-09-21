##FROM openjdk
##ARG JAR_FILE=target/*.jar
##COPY ${JAR_FILE} app.jar
##ENTRYPOINT ["java","-jar","/app.jar"]

FROM openjdk
FROM maven:latest
# image layer
WORKDIR /app
ADD pom.xml /app
# Image layer: with the application
COPY . /app
RUN mvn clean install -DskipTests
EXPOSE 8080
ADD ./target/demo-0.0.1-SNAPSHOT.jar /app
ENTRYPOINT ["java","-jar","/app/demo-0.0.1-SNAPSHOT.jar"]