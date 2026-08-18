FROM node:24.19.0-slim@sha256:3638d9a6fe4030bd716be989438248074489337ba3275657f93595428be4fc03 AS base

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=11.22.0
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app

FROM base AS export

# renovate: datasource=npm depName=playwright
ARG PLAYWRIGHT_VERSION=1.62.1
RUN npx --yes playwright@${PLAYWRIGHT_VERSION} install-deps chromium

# Keep this stage last: services using bare `build: .` resolve to it.
FROM base AS dev
