FROM eclipse-temurin:8-jdk-alpine

ENV TN_SIZE 150

WORKDIR /app

# Copy the application jar
COPY target/thumbnailer.jar /app/thumbnailer.jar

# Copy dependencies
COPY target/lib /app/lib

WORKDIR /pics

COPY entry-point.sh /entry-point.sh
RUN chmod +x /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]
