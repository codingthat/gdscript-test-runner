FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y jq coreutils wget zip libfontconfig1 && \
    apt-get purge --auto-remove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and unzip Godot v4.1.1
RUN wget https://downloads.tuxfamily.org/godotengine/4.1.1/Godot_v4.1.1-stable_linux.x86_64.zip && \
    unzip Godot_v4.1.1-stable_linux.x86_64.zip && \
    mv Godot_v4.1.1-stable_linux.x86_64 /usr/bin/godot && \
    rm Godot_v4.1.1-stable_linux.x86_64.zip

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
