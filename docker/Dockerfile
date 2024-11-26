ARG ARCH=
FROM ${ARCH}node:22.11.0-bookworm AS gosu
RUN apt-get update && apt-get -y install gosu

FROM ${ARCH}node:22.11.0-bookworm AS build
WORKDIR /app/
COPY package.json package-lock.json tsup.config.ts tsconfig.json ./
RUN npm install --include=dev
COPY src src
RUN npx tsup

FROM ${ARCH}node:22.11.0-bookworm-slim
WORKDIR /app/
COPY docker/create-user.sh /usr/bin/create-user.sh
COPY --from=gosu /usr/sbin/gosu /usr/sbin/gosu
COPY --from=build /app/dist/app.js /app/app.js
RUN chmod +x /usr/bin/create-user.sh
ENTRYPOINT [ "/usr/bin/create-user.sh" ]
CMD [ "/usr/local/bin/node", "/app/app.js" ]