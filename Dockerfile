FROM node:24.17.0-slim@sha256:862263c612aa437e3037674b85419622a9d93bff80aa1eee5398dfe686375532

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.34.4
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
