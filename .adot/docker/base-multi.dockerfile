FROM adot-debian-ansible:1.0.0

RUN apt-get remove docker docker-engine docker.io containerd runc || true
RUN apt-get update \
 && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
 && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
 && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
 && apt-get update \
 && apt-get install -y docker-ce-cli \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN echo 'alias red="docker container rm docker-host -f \
|| true && docker run -t -d  --name docker-host ubuntu-host:latest"' >> ~/.bashrc
RUN echo 'alias dssh="docker exec -it docker-host /bin/bash"' >> ~/.bashrc
RUN echo 'alias dstop="docker container stop docker-host"' >> ~/.bashrc
