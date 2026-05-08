FROM python:3.10-slim

WORKDIR /app

# Copy dependencies first for caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the model and inference script
COPY model.pkl .
COPY inference.py .

# Create necessary directories
RUN mkdir -p /input/logs /output

# Command to run the inference script
CMD ["python", "inference.py"]
