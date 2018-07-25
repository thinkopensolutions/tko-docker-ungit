FROM node:6-slim

RUN apt-get update && apt-get install --no-install-recommends -y \
        git \
        ssh \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && apt-get -y autoremove \
    && sync
    
RUN npm install ungit@1.4.31 -g \
    && sync

USER node
WORKDIR /home/node

VOLUME ["/var/www"]

EXPOSE 8448

CMD ["ungit", "--no-launchBrowser", "--forcedLaunchPath=/var/www"]
