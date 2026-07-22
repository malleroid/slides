FROM node:24.18.0-slim@sha256:6f7b03f7c2c8e2e784dcf9295400527b9b1270fd37b7e9a7285cf83b6951452d

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=11.15.1
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
