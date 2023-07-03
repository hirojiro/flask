from python:3.9

RUN apt-get update && apt-get install -y sqlite3 && apt-get install -y libsqlite3-dev

WORKDIR /usr/src/

COPY ./apps /usr/src/apps
COPY ./local.sqlite /usr/src/local.sqlite
COPY ./requirements.txt /usr/src/requirements.txt
COPY ./model.pt /usr/src/model.pt

RUN pip install --upgrade pip

RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

RUN pip install -r requirements.txt

RUN echo "building..."

ENV FLASK_APP "apps.app:create_app('local')"
ENV IMAGE_URL "/storage/images/"

EXPOSE 5000

CMD ["flask", "run", "-h", "0.0.0.0"]