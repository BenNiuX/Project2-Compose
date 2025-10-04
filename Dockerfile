FROM jenkins/jenkins:lts

USER root
# Add the jenkins user to the docker group
RUN groupadd docker && usermod -aG docker jenkins

USER jenkins
# Install the needed plugins
RUN jenkins-plugin-cli --plugins "workflow-aggregator configuration-as-code docker-plugin docker-workflow git blueocean ws-cleanup"

# Copy the jenkins.yaml file to the container which is used to configure security
COPY jenkins.yaml /var/jenkins_home/jenkins.yaml

EXPOSE 8080
EXPOSE 50000
