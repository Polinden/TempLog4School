FROM alpine
RUN apk add --update --no-cache curl py-pip tzdata postgresql-dev gcc python3-dev musl-dev
ENV TZ="Europe/Kiev"
WORKDIR /usr/local/
COPY code code
COPY cron cron
COPY requirements.txt requirements.txt
RUN python3 -m venv .
RUN source /usr/local/bin/activate
RUN python3 -m pip install --upgrade pip
RUN pip3 install -r requirements.txt
CMD cd /usr/local/code; source ../bin/activate; python3 manage.py collectstatic; gunicorn -b 0.0.0.0:8080 --workers=4 --threads=2 project1.wsgi & cd /usr/local; /usr/local/bin/celery -A cron worker -B 



