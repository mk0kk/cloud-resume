# Use Python 3.10.13 slim image as base
FROM python:3.10.13-slim

# Set working directory inside the container
WORKDIR /app

# Copy the application code into the container
COPY app.py .
COPY requirements.txt .
COPY test_app.py .
COPY README.md .

# Create the templates directory
RUN mkdir templates

# Copy the index.html file into the templates directory
COPY templates/index.html templates/

# Expose port 8080
EXPOSE 8080

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the application
CMD ["python3", "app.py"]