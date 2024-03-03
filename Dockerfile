# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt ./

# Install project dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Change ownership and permissions of the /app directory
RUN chmod -R 777 /app

# Set permissions for specific directories (adjust as needed)
RUN mkdir /tmp/cache && chmod -R 777 /tmp/cache

# Expose the port on which your service runs (40000)
EXPOSE 40000

# Run the label-studio command as the container's entry point
CMD ["label-studio"]

