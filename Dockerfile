FROM node:24.21.0-slim@sha256:d6aa754f16b3197301076f047b5def2f02ea1dbbc2ca920407d46d7ec7f87b20 AS base

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
