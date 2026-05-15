FROM node:24.15.0-slim@sha256:24dc26ef1e3c3690f27ebc4136c9c186c3133b25563ae4d7f0692e4d1fe5db0e

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=11.1.1
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
