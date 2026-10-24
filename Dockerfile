FROM node:24.22.1-slim@sha256:55fb5f5a527ea2c5c4a95f963e48ef90aa38c7b346054fdc8ee9957a2b55d205 AS base

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=12.15.0
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app

FROM base AS export

# renovate: datasource=npm depName=playwright
ARG PLAYWRIGHT_VERSION=1.64.1
RUN npx --yes playwright@${PLAYWRIGHT_VERSION} install-deps chromium

# Keep this stage last: services using bare `build: .` resolve to it.
FROM base AS dev
