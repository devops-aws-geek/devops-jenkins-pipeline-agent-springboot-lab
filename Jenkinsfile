#!groovy

pipeline {
	agent none  
    stages {
  	stage('Maven Install') {
    	agent {
      	docker {
        	image 'maven:3.9.6'
                args '-u root'
        }
      }
      steps {
      	sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t deepak2717/spring-petclinic:latest . --file /var/lib/jenkins/workspace/devops-pipeline-with-docker-agent-example/target/'
      }
    }
    stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) 
        {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push deepak2717/spring-petclinic:latest'
        }
      }
    }
  }
}
