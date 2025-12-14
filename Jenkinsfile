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

                    // builds the JAR and Docker image.
                    sh 'mvn clean package -s $ARTIFACTORY_SETTINGS -DskipTests'
                }
            }
        }
    }
}
