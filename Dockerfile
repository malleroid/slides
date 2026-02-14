FROM node:24.13.0-slim@sha256:39d7b5d7dbd148ee6b48a4755b06fa15338b3b0bbd59695d3980055596bae3c4

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.29.3
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
