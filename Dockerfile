FROM node:14



# Set the working directory
WORKDIR /app


# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install


# Copy the rest of the application
COPY . .

# Build the app for production
RUN npm run build

# Serve the app using a static server
RUN npm install -g serve
CMD ["serve", "-s", "build"]

# Expose the port
EXPOSE 3000