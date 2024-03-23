# FROM node:16-alpine as builder

# WORKDIR /app

# COPY package.json .

# RUN npm install

# COPY . .

# RUN npm run build

# FROM nginx

# EXPOSE 80

# COPY --from=builder /app/build /usr/share/nginx/html

# Dockerfile

# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install

# start app
CMD ["npm", "run", "start"]

# expose port
EXPOSE 3000

