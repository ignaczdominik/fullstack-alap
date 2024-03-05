FROM node:20-alpine3.17

WORKDIR /app

COPY package.json /app/package.json

RUN npm install

CMD ["npm", "run", "dev", "--","--host"]