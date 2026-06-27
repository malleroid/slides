FROM node:24.18.0-slim@sha256:b31e7a42fdf8b8aa5f5ed477c72d694301273f1069c5a2f71d53c6482e99a2fc

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.34.4
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
