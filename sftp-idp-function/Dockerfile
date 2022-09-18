# syntax=docker/dockerfile:1

FROM node:16 AS build

WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm ci

# Bundle app source
COPY . .
RUN npm run build

# This will use a minimal base image for the runtime
FROM public.ecr.aws/lambda/nodejs:16 as runtime

# Copy results from previous stage
COPY --from=build /usr/src/app/package*.json ./
RUN npm ci --production

COPY --from=build /usr/src/app/dist ./dist

RUN npm prune --production

ARG VERSION
ENV VERSION=$VERSION

CMD [ "dist/src/index.handler" ] 