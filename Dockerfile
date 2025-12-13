FROM eclipse-temurin:8-jdk-alpine

ENV TN_SIZE 150

WORKDIR /app

COPY target/thumbnailer.jar /app/thumbnailer.jar
COPY target/lib /app/lib

WORKDIR /pics
#testing
COPY entry-point.sh /entry-point.sh
RUN chmod +x /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]
