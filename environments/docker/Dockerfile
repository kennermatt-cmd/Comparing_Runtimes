# Use official Python image
FROM python:3.12-slim

# Set working directory inside container
WORKDIR /app

# Copy project files into container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r benchmark/requirements.txt

# Make sure output directory exists
RUN mkdir -p data/charts

# Default command: run the benchmark as "docker" environment
CMD ["python", "benchmark/sort_benchmark.py", "docker"]
