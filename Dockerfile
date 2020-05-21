FROM python:3.7.7-slim-stretch
RUN mkdir /app
COPY main.py /app
COPY requirements.txt /app
COPY test_main.py /app
WORKDIR /app

RUN apt-get update -y && apt-get upgrade -y
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]