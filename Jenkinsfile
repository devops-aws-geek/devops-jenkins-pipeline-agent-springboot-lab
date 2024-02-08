#!groovy

pipeline {
	agent none  stages {
  	stage('Maven Install') {
    	agent {
      	docker {
        	image 'maven:3.5.0'
        }
      }
      steps {
      	sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t deepak2717/spring-petclinic:latest .'
      }
    }
    stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKERHUB_USER')]) {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push deepak2717/spring-petclinic:latest'
        }
      }
    }
  }
}