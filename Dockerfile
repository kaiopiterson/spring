# Use a imagem do OpenJDK como base
FROM openjdk:8-jdk-alpine

# Crie um diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo WAR para o diretório de trabalho no contêiner
COPY target/springexample-0.0.1-SNAPSHOT.war /app/app.war

# Exponha a porta 8080
EXPOSE 8080

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "/app/app.war"]
