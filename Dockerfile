FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive apt update; \
    DEBIAN_FRONTEND=noninteractive apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        jq \
        software-properties-common \
        unzip;

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
    unzip awscliv2.zip; \
    rm awscliv2.zip; \
    ./aws/install;

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -; \
    DEBIAN_FRONTEND=noninteractive add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"; \
    DEBIAN_FRONTEND=noninteractive apt update; \
    DEBIAN_FRONTEND=noninteractive apt install -y \
        docker-ce;

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]