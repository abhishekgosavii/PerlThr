FROM node:18-alpine AS build

WORKDIR /app

RUN apk add --no-cache bash python3 make g++

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build || echo "No build script, skipping..."

EXPOSE 9000

CMD ["npm", "start"]
