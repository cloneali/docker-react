FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#  Second phase
FROM nginx
# copy fromo previous phase using --from=<phase-name>
COPY --from=builder /app/build /usr/share/nginx/html