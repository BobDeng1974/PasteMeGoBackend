FROM debian:stable-slim
LABEL maintainer="Lucien Shui" \
      email="lucien@lucien.ink"
COPY pastemed /usr/bin/
RUN chmod +x /usr/bin/pastemed && \
    mkdir /config && \
    echo '{"address":"0.0.0.0","port":8000,"debug":false,"database":{"type":"mysql","username":"username","password":"password","server":"pasteme-mysql","port":3306,"database":"pasteme"}}' > /config/config.json
CMD ["pastemed", "-c", "/config/config.json"]