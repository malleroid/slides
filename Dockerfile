FROM node:24.16.0-slim@sha256:2c87ef9bd3c6a3bd4b472b4bec2ce9d16354b0c574f736c476489d09f560a203

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.34.1
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
