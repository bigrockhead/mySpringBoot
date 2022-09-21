##FROM openjdk
##ARG JAR_FILE=target/*.jar
##COPY ${JAR_FILE} app.jar
##ENTRYPOINT ["java","-jar","/app.jar"]

FROM openjdk
#FROM maven:latest
# image layer
WORKDIR /app
ADD pom.xml /app
# Image layer: with the application
COPY . /app
RUN ./mvnw clean package
ADD ./target/demo-0.0.1-SNAPSHOT.jar /app
RUN rm -rf ./src; rm -rf ./target
ENTRYPOINT ["java","-jar","/app/demo-0.0.1-SNAPSHOT.jar"]