FROM node:20-slim AS base
RUN apt-get update && apt-get install wget -y
RUN whoami
RUN npm install -g pnpm
RUN mkdir /app
WORKDIR /app

COPY . /app
RUN pnpm run build
CMD [ "pnpm", "start" ]

