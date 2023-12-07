FROM maven:3.6.0-jdk-11-slim AS builder
COPY  myapp /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

ARG JAR_FILE=/usr/src/app/target/*.jar
RUN cp ${JAR_FILE} /usr/src/app/target/app.jar

FROM openjdk:11-jre-slim

COPY --from=builder /usr/src/app/target/app.jar /usr/app/app.jar

ENTRYPOINT ["java","-jar","/usr/app/app.jar"]