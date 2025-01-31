FROM python:3.9-alpine3.13
LABEL maintainer="m-smith.info"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./app /app

WORKDIR /app
EXPOSE 8000

RUN apk add -u zlib-dev jpeg-dev gcc musl-dev
RUN python3 -m venv /py && \
    /py/bin/pip3 install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-deps \
        build-base postgresql-dev musl-dev && \
    /py/bin/pip3 install -r /requirements.txt && \
    apk del .tmp-deps && \
    adduser --disabled-password --no-create-home app


ENV PATH="/py/bin:$PATH"

USER app