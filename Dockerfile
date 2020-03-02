FROM node:latest as node 
WORKDIR  /app
COPY package.json ./
RUN  npm install
COPY . .
RUN npm run build


FROM nginx:alpine
COPY --from=node   /app/dist/FrontAngular  /usr/share/nginx/html
EXPOSE 80
CMD ["nginx" ,"-g" ,"daemon off;"]