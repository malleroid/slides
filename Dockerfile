FROM node:24.14.1-slim@sha256:06e5c9f86bfa0aaa7163cf37a5eaa8805f16b9acb48e3f85645b09d459fc2a9f

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.33.0
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
