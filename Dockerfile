FROM node:20-alpine

WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install production dependencies
RUN npm install --omit=dev

# Copy the rest of the app
COPY . .

ENV NODE_ENV=production

EXPOSE 3000

CMD ["node", "server.js"]
