FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- files that are actually required from last step

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# startup command specification not required as  default nginx command is enough to start