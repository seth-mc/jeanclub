FROM python:3.9-alpine
LABEL maintainer="smc.net"

COPY ./requirements.txt /requirements.txt
COPY ./app /app
WORKDIR /app

RUN apk add --no-cache --update \
    python3 python3-dev gcc

RUN pip install --upgrade pip

RUN python -m venv /py && \
    /py/bin/pip install -r /requirements.txt && \
    adduser --disabled-password --no-create-home django-user

ENV PATH="/py/bin:$PATH"

USER django-user