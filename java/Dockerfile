FROM openjdk:11-jre-slim

# Set working directory
WORKDIR /app

# Copy the pre-built jar file
COPY auth-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]