# Etapa 1: Construção da imagem com Maven
FROM maven:3.8.4-openjdk-21-slim AS build

WORKDIR /app
COPY . .

# Compila o projeto e cria o JAR
RUN mvn clean package -DskipTests

# Etapa 2: Construção da imagem do Java
FROM openjdk:21-jre-slim

WORKDIR /app

# Copia o arquivo JAR gerado na etapa anterior para a imagem final
COPY --from=build /app/target/*.jar app.jar

# Expõe a porta que a aplicação Spring Boot vai rodar
EXPOSE 8080

# Comando para rodar o JAR da aplicação
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
