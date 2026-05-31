FROM node:24.16.0-slim@sha256:242549cd46785b480c832479a730f4f2a20865d61ea2e404fdb2a5c3d3b73ecf

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.34.1
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
