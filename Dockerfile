FROM maven:3-jdk-13-alpine as builder

WORKDIR /app

COPY ./pom.xml ./pom.xml
COPY ./src ./src

RUN mvn package

FROM openjdk:11

COPY --from=builder /app/target/products-service-example-*.jar /target/products-service-example.jar

EXPOSE 8080

CMD ["java", "-jar", "/target/products-service-example.jar"]