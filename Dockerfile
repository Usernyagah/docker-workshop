# Use Python 3.13 slim image as base
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Install uv for fast Python package management
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Copy project files
COPY . .

# Install dependencies using uv
RUN uv sync --frozen --no-install-project

# Set the entrypoint to run the pipeline script
ENTRYPOINT ["uv", "run", "python", "pipeline/pipeline.py"]