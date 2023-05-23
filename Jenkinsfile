pipeline {
    agent any

    stages {
        stage('Maven build') {
            steps {
               sh 'rm -rf spring*'
               sh 'git clone https://github.com/rejunath/spring-petclinic.git'
               sh 'cd spring-petclinic && mvn deploy'
            }
        }
        stage('Docker build for application') {
            steps {
                sh 'cd spring-petclinic && docker build -t rejuaws/petclinic:v1 .'
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
                
                sh 'nohup java -jar spring-petclinic/target/*.jar --server.port=8083 &'
                sh 'sleep 1m'
            }
        }
    }
}
