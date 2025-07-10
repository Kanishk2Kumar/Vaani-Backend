# Use a lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy only relevant files & folders
COPY api_server.py .
COPY modules/ ./modules
COPY Context/ ./Context
COPY .env .

# Expose the FastAPI port
EXPOSE 8000

# Run the API
CMD ["uvicorn", "api_server:app", "--host", "0.0.0.0", "--port", "8000"]
