FROM python:3.10-slim

RUN apt-get update && apt-get upgrade -y && \
    apt-get purge -y imagemagick libmagickwand* libmagickcore* || true && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
# Upgrade pip and setuptools to latest patched versions globally
RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "main.py"]
