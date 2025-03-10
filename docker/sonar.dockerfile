FROM python:3.7.2-alpine3.9

WORKDIR /usr/src/local/sonar

COPY ./docker/sonar/requirements.txt .

RUN pip install -r requirements.txt

COPY ./docker/sonar/ping.py .

ENV PYTHONUNBUFFERED=1

ENTRYPOINT [ "python" ]
CMD [ "ping.py" ]
