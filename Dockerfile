FROM node:latest


# Create app directory
WORKDIR /var/www/backend


# Install app dependencies - For NPM use: `COPY package.json package-lock.lock ./`
COPY package.json yarn.lock ./ 
# For NPM use: `RUN npm ci`
RUN yarn --pure-lockfile

# Copy important files - Add ormconfig.ts here if using Typeorm
#COPY .eslintrc nest-cli.json tsconfig.json tsconfig.build.json ./
COPY . .


RUN yarn build


# Add storage folder to the container (If you want to add other folder contents to the container)
# ADD storage /var/www/backend/storage
EXPOSE 3000
# Entrypoint command - Replace `"yarn"` with `"npm", "run"` if you are using NPM as your package manager.
# You can update this to run other NodeJS apps
CMD [ "yarn", "start:prod", "--preserveWatchOutput" ]