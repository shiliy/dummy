

FROM maven:3.8.1-jdk-11 AS builder
WORKDIR /home/mvn
COPY . .
RUN mvn clean install 


FROM openjdk:11-jdk-alpine
COPY --from=builder ./target/*.jar ./app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","./app.jar"]
