FROM python:3.12-slim AS builder

WORKDIR /docs
COPY pyproject.toml ./
RUN pip install .
COPY mkdocs.yml .
COPY docs/ docs/
RUN mkdocs build --clean

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /docs/site /usr/share/nginx/html
