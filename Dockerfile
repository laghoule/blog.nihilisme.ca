FROM debian:stable

RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

ARG HUGO_VERSION=0.151.2

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-amd64.deb \
    && dpkg -i hugo_extended_${HUGO_VERSION}_Linux-amd64.deb \
    && rm hugo_extended_${HUGO_VERSION}_Linux-amd64.deb

COPY . /src/
WORKDIR /src/

RUN chown -R 65534 /src/
USER 65534

EXPOSE 8080

CMD ["hugo", "server", "-D", "-b", "--minify", "--gc", "http://0.0.0.0/", "--bind=0.0.0.0", "--port=8080"]
