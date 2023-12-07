FROM maven:3.6.0-jdk-11-slim AS builder

COPY  myapp/src /usr/src/app/src
COPY  myapp/pom.xml /usr/src/app/pom.xml

RUN mvn -f /usr/src/app/pom.xml clean package

ARG JAR_FILE=./target/*.jar
COPY ${JAR_FILE} /usr/src/app/target/app.jar


FROM openjdk:11-jre-slim
COPY --from=builder /usr/src/app/target/app.jar /usr/app/app.jar


ENTRYPOINT ["java","-jar","/usr/app/app.jar"]