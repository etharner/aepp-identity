FROM tamasbarta/docker-android-sdk:27.0.3

ENV NODEJS_VERSION=8.11.2 \
    PATH=$PATH:/opt/node/bin

RUN apt-get update && \
    apt-get install -y python \
                       build-essential \
                       libfontconfig \
                       curl \
                       gradle \
		               imagemagick &&\
    curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 &&\
    rm -rf /var/lib/apt/lists/*

RUN npm i -g cordova && cordova telemetry off

WORKDIR /
COPY package.json package.json
RUN npm install

WORKDIR /app

ADD . .

RUN cordova platform remove android && cordova platform add android
