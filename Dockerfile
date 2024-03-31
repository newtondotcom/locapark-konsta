FROM node:lts as build-deps
WORKDIR /usr/src/app
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm
RUN pnpm i
COPY . ./
RUN pnpm build

FROM nginx:stable-alpine3.17
LABEL Developers="Robin Augereau"
COPY --from=build-deps /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]