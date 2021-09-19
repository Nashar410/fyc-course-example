# Use official node image as the base image
FROM node:16-alpine3.14 as build

# Set the working directory
WORKDIR /opt/project

# Add the source code to app
COPY . /opt/project/

RUN yarn global add -g @nestjs/cli

# Install all the dependencies
RUN yarn install

# Generate the build of the application
RUN yarn run build

EXPOSE 3000

CMD ["yarn", "run", "start:dev"]
