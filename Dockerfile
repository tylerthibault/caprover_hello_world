# Use an official Python runtime as the base image
FROM python:3.12

# Set the working directory in the container
WORKDIR /app

# Copy Pipenv files first (to leverage Docker cache if dependencies don’t change)
COPY Pipfile Pipfile.lock ./

# Install pipenv and use it to install dependencies into the system environment
RUN pip install pipenv && pipenv install --system --deploy

# Copy the rest of the application code
COPY . .

# Expose the port (for documentation; actual binding will be via the PORT env var)
EXPOSE 5000

# Run Gunicorn with dynamic port binding (using the environment variable PORT, defaulting to 5000)
CMD sh -c "gunicorn --bind 0.0.0.0:${PORT:-5000} wsgi:app"
