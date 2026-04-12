FROM node:24.14.1-slim@sha256:b506e7321f176aae77317f99d67a24b272c1f09f1d10f1761f2773447d8da26c

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.33.0
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
