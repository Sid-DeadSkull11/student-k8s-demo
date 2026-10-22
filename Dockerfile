FROM python:3.12-slim

WORKDIR /app

# Combine COPY and RUN to optimize layer caching if requirements don't change
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY app.py .

EXPOSE 5000

# Optional but highly recommended: Run as a non-root user for security
USER 10001

# Ensure Python outputs everything immediately to the logs
ENV PYTHONUNBUFFERED=1

CMD ["python", "app.py"]
