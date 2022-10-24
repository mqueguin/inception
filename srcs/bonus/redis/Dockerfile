FROM alpine:3.16

RUN apk update && apk upgrade && \
    apk add --no-cache redis && \
    sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis.conf && \
    sed -i "s|# maxmemory <bbytes>|maxmemory 20mb|g" /etc/redis.conf && \
    echo "maxmemory-policy allkeys-1ru" /etc/redis.conf

EXPOSE 6379

CMD [ "redis-server", "/etc/redis.conf" ]