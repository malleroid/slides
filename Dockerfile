FROM node:24.18.0-slim@sha256:cb4e8f7c443347358b7875e717c29e27bf9befc8f5a26cf18af3c3dec80e58c5

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.34.5
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
