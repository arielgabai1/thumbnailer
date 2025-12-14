FROM eclipse-temurin:8-jdk-alpine

ENV TN_SIZE 150

WORKDIR /app

COPY target/thumbnailer.jar /app/thumbnailer.jar
COPY target/lib /app/lib

WORKDIR /pics

COPY entry-point.sh /entry-point.sh
RUN chmod +x /entry-point.sh

RUN adduser -D -u 1001 myuser
USER myuser

ENTRYPOINT ["/entry-point.sh"]
