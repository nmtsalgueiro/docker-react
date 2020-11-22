FROM node:alpine as myBuilder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
#RUN phase
FROM nginx
COPY --from=myBuilder /app/build /usr/share/nginx/html
