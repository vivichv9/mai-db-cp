FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libpq-dev gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install poetry

COPY ./backend/app ./app
COPY ./backend/.env .env
COPY poetry.lock pyproject.toml ./

RUN poetry config virtualenvs.create false && poetry install --no-dev --no-interaction --no-ansi

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
