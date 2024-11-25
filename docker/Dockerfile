ARG ARCH=
FROM ${ARCH}node:22.11.0-bookworm AS build
WORKDIR /app/
COPY package.json package-lock.json tsup.config.ts tsconfig.json ./
RUN npm install --include=dev
COPY src src
RUN npx tsup

FROM ${ARCH}node:22.11.0-bookworm-slim
WORKDIR /app/
COPY --from=build /app/dist/app.js /app/app.js
CMD [ "node", "/app/app.js" ]
