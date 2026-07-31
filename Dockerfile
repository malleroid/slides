FROM node:24.18.1-slim@sha256:235600a8101ab264e117b1768e925532262668dc9b581ef1dd7d96ced463b8e7

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.34.5
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
