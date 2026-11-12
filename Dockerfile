FROM python:3.10-slim

# Update system and remove unused graphics/ImageMagick packages that cause vulnerabilities
RUN apt-get update && apt-get upgrade -y && \
    apt-get purge -y imagemagick libmagickwand* libmagickcore* || true && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "main.py"]
