FROM node:24.15.0-slim@sha256:f96cade014243001e5c18f1befaf0bf44564f7cf358287ef691114dcb04b173b

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.33.2
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
