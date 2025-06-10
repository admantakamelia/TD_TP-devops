# Étape 1 : Compilation avec un JDK complet
#FROM eclipse-temurin:17-jdk-alpine AS build

#WORKDIR /usr/src/app
#COPY Main.java .
#RUN javac Main.java

# Étape 2 : Image finale légère avec juste le JRE
#FROM eclipse-temurin:17-jre-alpine

#WORKDIR /app
#COPY --from=build /usr/src/app/Main.class .

#CMD ["java", "Main"]

FROM eclipse-temurin:21-jdk-alpine AS myapp-build
ENV MYAPP_HOME=/opt/myapp
WORKDIR $MYAPP_HOME

RUN apk add --no-cache maven

COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

# Run stage
FROM eclipse-temurin:21-jre-alpine
ENV MYAPP_HOME=/opt/myapp
WORKDIR $MYAPP_HOME
COPY --from=myapp-build $MYAPP_HOME/target/*.jar $MYAPP_HOME/myapp.jar

ENTRYPOINT ["java", "-jar", "myapp.jar"]