FROM node:24.13.0-slim@sha256:92e2f331bdebf6ec02697c7ae1b3bbb353c88799bf1cb65c7328874d276dd4b7

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.29.3
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
