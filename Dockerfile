# Use Python 3.7 image as base
FROM python:3.7-slim

# Set work directory in the container
WORKDIR /app

# Install pipenv
RUN pip3 install --no-cache-dir pipenv

# Copy Pipfile and Pipfile.lock
COPY Pipfile Pipfile.lock* /app/

# Install dependencies using pipenv
RUN pipenv install --deploy --system

# Copy project files
COPY . /app

# Expose the port 5000
EXPOSE 5000

# Run the application
CMD ["python3", "app.py"]
