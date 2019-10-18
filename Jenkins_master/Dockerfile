FROM jenkins/jenkins
USER root
COPY ./plugins /tmp/plugins
COPY --chown=jenkins:jenkins ./preconfigure/ /usr/share/jenkins/ref/init.groovy.d

# Install Docker
RUN apt-get update && \
    apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable"

RUN apt-get update && \
    apt-get -y install docker-ce=5:19.03.3~3-0~ubuntu-bionic docker-ce-cli=5:19.03.3~3-0~ubuntu-bionic containerd.io=1.2.6-3

RUN usermod -aG docker jenkins

USER jenkins
ENV  JAVA_OPTS="-Xmx768m -Djenkins.install.runSetupWizard=false"
EXPOSE 8080 50000
RUN /usr/local/bin/install-plugins.sh < /tmp/plugins
