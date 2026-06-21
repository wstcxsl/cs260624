FROM alpine:3.20
RUN apk add --no-cache wget tar
WORKDIR /app
RUN wget https://github.com/SagerNet/sing-box/releases/download/v1.10.1/sing-box-1.10.1-linux-amd64.tar.gz && \
    tar -zxvf sing-box-1.10.1-linux-amd64.tar.gz && \
    mv sing-box-1.10.1-linux-amd64/sing-box ./ && \
    rm -rf sing-box-1.10.1-linux-amd64*
COPY config.json .
EXPOSE 8080
CMD ["./sing-box", "run", "-c", "config.json"]
