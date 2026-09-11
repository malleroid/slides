FROM node:24.21.0-slim@sha256:2fe369e969550cde8e867afc3fe370b260140cab4a23d467074295b42163d553 AS base

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=12.4.0
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app

FROM base AS export

# renovate: datasource=npm depName=playwright
ARG PLAYWRIGHT_VERSION=1.63.0
RUN npx --yes playwright@${PLAYWRIGHT_VERSION} install-deps chromium

# Keep this stage last: services using bare `build: .` resolve to it.
FROM base AS dev
