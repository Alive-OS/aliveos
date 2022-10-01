FROM agramakov/aliveos:dev

ENV ALIVEOS_WS_DIR /home/aliveos/aliveos_ws

# Add aliveos workspace
RUN mkdir -p $ALIVEOS_WS_DIR
RUN chown -R aliveos $ALIVEOS_WS_DIR
WORKDIR /home/aliveos/aliveos_ws
