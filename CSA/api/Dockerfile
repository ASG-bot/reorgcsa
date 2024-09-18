# Image
FROM python:3.12-slim

# Install poetry
RUN pip install poetry

# Dir app
WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN poetry install --no-root

COPY . .

# Publish
CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
