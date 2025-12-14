pipeline {
    agent any

    tools {
        jdk 'OpenJDK 8'
        maven 'Maven 3.6.2'
    }
    stages {
        stage('build') {
            steps {
                configFileProvider([configFile(fileId: 'artifactory-settings', variable: 'ARTIFACTORY_SETTINGS')]) {

                    // Builds the JAR and Docker image.
                    // Lifecycle 'package' executes phases: clean -> validate -> compile -> test -> package
                    sh 'mvn clean package -s $ARTIFACTORY_SETTINGS -DskipTests'
                }
            }
        }
    }
}