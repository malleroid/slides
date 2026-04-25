FROM node:24.15.0-slim@sha256:03eae3ef7e88a9de535496fb488d67e02b9d96a063a8967bae657744ecd513f2

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.33.1
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
