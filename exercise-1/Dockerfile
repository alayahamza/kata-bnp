FROM docker.io/maven:3.9.6-eclipse-temurin-17-alpine as base
ARG app
ARG version
ENV user="root"
USER $user
COPY src src
COPY pom.xml pom.xml
RUN mvn clean install

FROM docker.io/eclipse-temurin:17.0.10_7-jre-alpine
ARG app
ARG version
ENV user="my-user"
RUN addgroup --gid 1234 my-users && \
    adduser --disabled-password --uid 1000 $user
USER $user
WORKDIR /home/$user
COPY --from=base target/$app-$version.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]