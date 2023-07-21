FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/employeems-0.01-SNAPSHOT.jar employeems.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","demo.jar" ]