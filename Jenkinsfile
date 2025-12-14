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
                    sh 'mvn clean install -s $ARTIFACTORY_SETTINGS'
                }
            }
        }
    }
}
//testing