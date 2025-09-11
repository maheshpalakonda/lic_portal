FROM node:20-alpine

WORKDIR /app

# Install curl for healthcheck
RUN apk add --no-cache curl

# Copy dependency files
COPY package*.json ./

# Install production dependencies
RUN npm install --omit=dev

# Copy the rest of the app
COPY . .

ENV NODE_ENV=production

EXPOSE 3000

CMD ["node", "server.js"]
