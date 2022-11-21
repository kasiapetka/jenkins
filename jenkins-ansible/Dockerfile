FROM  jenkins/jenkins

#in jenkins a jenkins user is a default one so we need to change it in order to have all permissions
USER root

RUN apt-get update && apt-get -y install ansible

USER jenkins