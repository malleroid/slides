FROM node:24.14.0-slim@sha256:e8e2e91b1378f83c5b2dd15f0247f34110e2fe895f6ca7719dbb780f929368eb

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.30.2
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
