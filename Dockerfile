FROM python:3.10-slim

RUN apt-get update && apt-get upgrade -y && \
    apt-get purge -y imagemagick libmagickwand* libmagickcore* || true && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

# Force pip to upgrade setuptools past the vulnerable version
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --upgrade "setuptools>=78.1.1" && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "main.py"]
