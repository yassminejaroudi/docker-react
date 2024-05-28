from node:16-alpine as builder
workdir /home/node/app
copy package.json .
run npm install
copy . .
run npm run build

from nginx
copy --from=builder /home/node/app/build /usr/share/nginx/html