FROM openjdk AS build-stage
#FROM maven:latest
# image layer
WORKDIR /app
ADD . /app
RUN /app/mvnw verify clean package -DskipTest --fail-never

# Image layer: with the application
FROM openjdk AS deploy-stage
WORKDIR /developments/
COPY --from=build-stage /app/target/*.jar ./
EXPOSE 8080
ENTRYPOINT ["java","-jar","/developments/demo-0.0.1-SNAPSHOT.jar"]