FROM node:20-slim AS base
RUN apt-get update && apt-get install wget python3 make g++ -y
RUN whoami
RUN mkdir /app
WORKDIR /app

COPY . /app

RUN npm install
RUN npm build
CMD [ "npm", "start" ]

