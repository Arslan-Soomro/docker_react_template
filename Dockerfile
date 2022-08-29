# Set Node alpine as base image
FROM node:16-alpine

# RUN apk add yarn # No more needed as yarn is already installed on node base image

# Create directories
RUN mkdir -p /project/app

# Move into project directory
WORKDIR /project/app

# Install node packages and update path
COPY package.json yarn-lock.json* .yarnrc ./
RUN yarn install
ENV PATH /project/node_modules/.bin:$PATH

# Copy source files into container
COPY . .

# run as unpriviliged node user instead of root
USER node

# Start this script first
ENTRYPOINT [ "./entrypoint.sh" ]

# Start the app
CMD ["npm", "run", "dev"]