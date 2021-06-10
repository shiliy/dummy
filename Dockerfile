

FROM maven:3.8.1-jdk-11 AS builder
WORKDIR /home/mvn
COPY . .
RUN mvn clean install 


FROM openjdk:11-slim
COPY --from=builder /home/mvn/target/*.jar ./app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","./app.jar"]
