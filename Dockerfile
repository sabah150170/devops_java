# Stage 1: Build stage
FROM maven:3.8.4-openjdk-11-slim AS build_stage
WORKDIR /app

# Download project dependencies
COPY ./pom.xml .
RUN mvn dependency:go-offline

COPY ./src ./src

# Build the application
RUN mvn package

# Stage 2: Final stage
FROM openjdk:11-jre-slim
WORKDIR /app

# Copy the JAR file from the build stage to the final stage
COPY --from=build_stage /app/target/app-0.0.1-SNAPSHOT.jar .

EXPOSE 9080

# Run the application
CMD ["java", "-jar", "app-0.0.1-SNAPSHOT.jar"]
