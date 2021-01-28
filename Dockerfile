FROM ubuntu:latest
EXPOSE 80/tcp
EXPOSE 8000/tcp

COPY . app/
WORKDIR /app/



RUN echo 'Aquire::http { Proxy "http://172.17.0.3.3142";};' > /etc/apt/apt.conf.d/01proxy && bash cfg.sh
