FROM node:22.3-bookworm-slim

RUN apt-get update && \
    apt-get install -y --only-upgrade git=1:2.20.1-2+deb10u9 git-man=1:2.20.1-2+deb10u9 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD package.json .
ADD index.js .
ADD build .
COPY . .
RUN npm install

EXPOSE 8080

CMD [ "node", "index.js" ]
