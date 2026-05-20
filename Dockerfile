FROM node:24.15.0-slim@sha256:4e6b70dd6cbfc88c8157ba19aa3d9f9cce6ba4703576d55459e45efcbc9c5f5d

# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION=10.33.4
RUN npm install -g pnpm@${PNPM_VERSION}

WORKDIR /app
