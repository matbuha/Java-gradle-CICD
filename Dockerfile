FROM openjdk:8-jre-alpine

EXPOSE 8080
RUN ./gradlew build
RUN docker build -t java-app .
RUN docker tag java-app demo-app:java-1.0
COPY ./build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
