# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables to ensure that Python outputs the text in a way that is friendly for Docker
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Command to run on container start
CMD ["python", "app.py"]
