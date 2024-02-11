FROM anapsix/alpine-java 
LABEL maintainer="dsingh.awsdevops@gmail.com"
COPY /var/lib/jenkins/workspace/devops-pipeline-with-docker-agent-example/target/spring-petclinic-1.5.1.jar /home/spring-petclinic-1.5.1.jar 
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]
