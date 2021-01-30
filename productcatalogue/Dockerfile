FROM quay.io/ssmiller25/maven:3-jdk-8 as builder
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn clean install
FROM openjdk:8-jre
COPY --from=builder /tmp/target/productcatalogue-0.0.1-SNAPSHOT.jar app.jar
COPY product-catalogue.yml app-config.yml
EXPOSE 8020
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar", "server", "app-config.yml"]
