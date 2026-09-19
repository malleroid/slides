FROM node:24.21.0-slim@sha256:0e0ff40c39bc087845bfb27465a0df4ea419520094bc35842ff83dd8cbe6f9b6 AS base

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=12.4.2
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app

FROM base AS export

# renovate: datasource=npm depName=playwright
ARG PLAYWRIGHT_VERSION=1.63.0
RUN npx --yes playwright@${PLAYWRIGHT_VERSION} install-deps chromium

# Keep this stage last: services using bare `build: .` resolve to it.
FROM base AS dev
