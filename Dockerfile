FROM python:3.11-alpine AS builder
WORKDIR /app
RUN pip install --upgrade pip
ENV PYTHONPATH=${PYTHONPATH}:${PWD}
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app
RUN chgrp -R root /app && chmod -R g+rwX /app
RUN python database.py
RUN python adduser.py
EXPOSE 5000
CMD ["flask", "--app", "softdes.py", "run"]

