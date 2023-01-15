FROM python:alpine3.17
WORKDIR /app
RUN pip3 install flask
COPY ./app.py .
EXPOSE 81
CMD [ "flask", "run","--host","0.0.0.0","--port","81" ]