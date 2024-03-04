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

# Adjust permissions to ensure the directory is writable by arbitrary users
RUN chmod -R 777 /app && \
    mkdir /tmp/cache && chmod -R 777 /tmp/cache && \
    mkdir -p /.local && chmod -R 777 /.local

# Expose the port on which your service runs
EXPOSE 8081

# Run the label-studio command as the container's entry point
CMD ["label-studio"]
