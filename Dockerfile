# syntax=docker/dockerfile:1
FROM jenkins/jenkins:lts-jdk11

# Disable the Jenkins setup wizard and suppress illegal reflective access operation warnings.
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false --illegal-access=deny"
ENV CASC_JENKINS_CONFIG /var/jenkins_home/jenkins_config.yaml

# Switch to the root user for permission to install python
USER root

# Install app dependencies & python
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install django-jenkins

# Switch back to the user jenkins to ensure that Jenkins runs using the appropriate permissions
USER jenkins

# Copy list of suggested plugins, jenkins config, & seed job for Jenkins setup
COPY jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY jenkins/jenkins_config.yaml /var/jenkins_home/jenkins_config.yaml

# Install the suggested plugins
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt