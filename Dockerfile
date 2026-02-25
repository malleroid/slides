FROM node:24.14.0-slim@sha256:5f5788dfb37df047dddb2e5a6d7544d2fcc994408284518e6fc31edf5233585a

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.30.1
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
