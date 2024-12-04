FROM node:20-slim AS base
RUN apt-get update && apt-get install wget python3 make g++ -y
RUN whoami
RUN npm install -g pnpm
RUN mkdir /app
WORKDIR /app

COPY . /app

RUN pnpm install
RUN pnpm run build
CMD [ "pnpm", "start" ]

