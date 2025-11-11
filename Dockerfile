# Usa una imagen oficial de OpenJDK 17
FROM eclipse-temurin:17-jdk-alpine

# Crea un directorio dentro del contenedor para la app
WORKDIR /app

# Copia el archivo pom.xml y los archivos de configuración de Maven
COPY pom.xml ./
COPY mvnw ./
COPY .mvn .mvn

# Descarga las dependencias (para aprovechar la caché)
RUN ./mvnw dependency:go-offline

# Copia el resto del código fuente
COPY src ./src

# Construye el JAR sin ejecutar tests
RUN ./mvnw clean package -DskipTests

# Expone el puerto (Render usa una variable de entorno llamada PORT)
EXPOSE 8080

# Comando de inicio
CMD ["java", "-jar", "target/portfolio-0.0.1-SNAPSHOT.jar"]