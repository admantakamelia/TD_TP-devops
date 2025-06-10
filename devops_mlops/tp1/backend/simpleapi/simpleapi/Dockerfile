# Build stage
FROM eclipse-temurin:21-jdk-alpine AS myapp-build
ENV MYAPP_HOME=/opt/myapp
WORKDIR $MYAPP_HOME

# Installer Maven
RUN apk add --no-cache maven

# Copier les fichiers pom.xml et src pour éviter de reconstruire à chaque modification du code
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

# Run stage
FROM eclipse-temurin:21-jre-alpine
ENV MYAPP_HOME=/opt/myapp
WORKDIR $MYAPP_HOME

# Copier le fichier .jar depuis l'étape précédente
COPY --from=myapp-build $MYAPP_HOME/target/*.jar $MYAPP_HOME/myapp.jar

# Lancer l'application avec Java
ENTRYPOINT ["java", "-jar", "myapp.jar"]
