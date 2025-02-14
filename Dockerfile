# Etapa de construcción
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Etapa de producción
FROM node:18-alpine AS production

WORKDIR /app

COPY --from=build /app ./

EXPOSE 5000

CMD ["node", "dist/main.js"]
