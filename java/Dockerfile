# Gunakan base image Maven untuk build
# Gunakan base image Java untuk runtime
FROM openjdk:11-jre-slim

# Set working directory
WORKDIR /app

# Copy file jar hasil build
COPY --from=builder auth-0.0.1-SNAPSHOT.jar app.jar

# Ekspos port 8080
EXPOSE 8080

# Jalankan aplikasi
CMD ["java", "-jar", "app.jar"]