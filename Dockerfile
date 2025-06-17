FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy bot code
COPY recipe_bot.py .

# Create data directory
RUN mkdir -p /data

# Set environment
ENV PYTHONUNBUFFERED=1
ENV DATA_DIR=/data

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD python -c "import os; exit(0 if os.path.exists('/data/recipes.db') else 1)"

# Run bot
CMD ["python", "recipe_bot.py"]