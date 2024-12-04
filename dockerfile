FROM node:20-slim AS base
RUN apt-get update && apt-get install wget -y
RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.shrc" SHELL="$(which sh)" sh -


RUN mkdir /app
WORKDIR /app

COPY . /app
RUN pnpm run build
CMD [ "pnpm", "start" ]

