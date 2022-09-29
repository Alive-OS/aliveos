FROM agramakov/aliveos:dev

# Workdir
RUN mkdir /opt/aliveos/workspace
WORKDIR /opt/aliveos/workspace

# Add local sources
ADD ./src /opt/aliveos/workspace/src

# Resolve dependencies
RUN rosdep install -i --from-path src --rosdistro foxy -y; exit 0
