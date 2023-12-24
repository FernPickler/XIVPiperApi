FROM python:3.11

RUN pip install poetry

WORKDIR /app

COPY pyproject.toml poetry.lock ./
COPY xivpiperapi ./xivpiperapi
RUN touch README.md

RUN poetry install

#ENTRYPOINT ["poetry", "run", "python", "-m", "xivpiperapi.main"]

CMD ["poetry", "run", "uvicorn", "xivpiperapi.main:app", "--host", "0.0.0.0", "--port", "80"]