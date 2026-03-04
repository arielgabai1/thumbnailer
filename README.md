# Thumbnailer

A robust, containerized Java application designed to generate thumbnails from various image formats (including TIFF). Built with Maven and Docker, featuring automated Jenkins CI pipelines.

## Features

- **CLI-driven**: Powered by `picocli` for a seamless command-line experience.
- **Broad Image Support**: Leverages `imageio-tiff` (by Terry Gilliam) to support complex image formats beyond standard JPEG/PNG.
- **Containerized**: Fully Dockerized for easy deployment and consistent execution environments.
- **CI/CD Ready**: Includes a declarative `Jenkinsfile` for automated building and testing.

## Technology Stack

- **Language:** Java 8
- **Build Tool:** Maven (3.6+)
- **CLI Framework:** PicoCLI
- **Containerization:** Docker (Alpine JDK 8 Base)
- **CI/CD:** Jenkins

## Getting Started

### Prerequisites

- Docker
- Java 8 & Maven (if building locally without Docker)

### Docker Usage

The application is designed to run in a Docker container, processing images from a mounted volume.

```bash
# Build the Docker image manually (or use Maven)
docker build -t develeap/thumbnailer .

# Run the container (mount your images to /pics)
docker run -v /path/to/your/images:/pics -e TN_SIZE=200 develeap/thumbnailer
```

*Note: The default thumbnail size (`TN_SIZE`) is `150` if not specified.*

### Local Maven Build

To build the project locally and create the executable JAR:

```bash
mvn clean package
```

This will output the required artifacts into the `target/` directory, including copying all dependencies to `target/lib`.

## How It Works

The Docker container sets the working directory to `/pics`. When the container runs, the `entry-point.sh` script executes the Java application, configuring the classpath to include the application JAR and its dependencies. It also injects the `TN_SIZE` environment variable as a system property (`-Dthumbnail.size`).

## CI/CD Pipeline

The project includes a `thumbnailer.Jenkinsfile` that defines a build pipeline:

1. Uses JDK 8 and Maven.
2. Resolves dependencies from Artifactory (using the `artifactory-settings` config file).
3. Executes a clean package build (`mvn clean package`).

*Created as part of a DevOps engineering portfolio.*
