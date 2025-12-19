FROM debian:trixie

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 \
    python3-pip \
    python3-dev \
    build-essential \
    lm-sensors

RUN pip3 install --break-system-packages "glances[web]"

CMD ["glances", "-w", "-B", "0.0.0.0"]
