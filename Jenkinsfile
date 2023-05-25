pipeline {
    agent any

    stages {
        stage('Maven build') {
            steps {
               sh 'mvn deploy'
            }
        }
        stage('Docker build for application') {
            steps {
                sh 'docker build -t rejuaws/petclinic:v1 .'
            }
        }
        stage('Docker run for application') {
            steps {
                sh 'docker run -d --name petclinic rejuaws/petclinic:v1'
            }
        }
        stage('Docker push for application') {
            steps {
                sh 'docker push rejuaws/petclinic:v1'
            }
        }
        stage('Docker rmi for application') {
            steps {
                sh 'docker stop petclinic'
                sh 'docker rm petclinic'
                sh 'docker rmi rejuaws/petclinic:v1'
            }
        }
        stage('Deploy application') {
            steps {
                
                sh 'nohup java -jar target/*.jar --server.port=8083 &'
                sh 'sleep 1m'
            }
        }
    }
}
