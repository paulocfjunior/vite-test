FROM node:lts

WORKDIR /var/www/html/app

COPY ./app/package.json package.json
COPY ./app/package-lock.json package-lock.json

RUN npm ci

COPY ./app/public public
COPY ./app/src src
COPY ./app/index.html index.html
COPY ./app/tsconfig.json tsconfig.json
COPY ./app/tsconfig.node.json tsconfig.node.json
COPY ./app/vite.config.ts vite.config.ts

RUN npm run build

CMD ["npm", "run", "dev"]