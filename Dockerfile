# Use an official lightweight runtime as a parent image
FROM node:18-alpine 

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json before installing dependencies
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Expose the port your app runs on
EXPOSE 3000  # Change this if your app uses a different port

# Start the application
CMD ["npm", "start"]  # Change this to match your project's start command
