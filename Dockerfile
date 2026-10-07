FROM node:24.21.0-slim@sha256:b96009b6b18dc15ae52781abe71029198436d556149f441a11a44a706055c3a5 AS base

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=12.9.1
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app

FROM base AS export

# renovate: datasource=npm depName=playwright
ARG PLAYWRIGHT_VERSION=1.63.0
RUN npx --yes playwright@${PLAYWRIGHT_VERSION} install-deps chromium

# Keep this stage last: services using bare `build: .` resolve to it.
FROM base AS dev
