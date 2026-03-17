FROM node:24.14.0-slim@sha256:d8e448a56fc63242f70026718378bd4b00f8c82e78d20eefb199224a4d8e33d8

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.32.1
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
