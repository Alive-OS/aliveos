FROM agramakov/aliveos:dev

ENV USER aliveos
ENV ALIVEOS_WS_DIR /home/aliveos/aliveos_ws
RUN echo 'root:aliveos' | chpasswd

RUN apt-get update

# SSH
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22

# Add aliveos user and the workspace
RUN adduser --disabled-password --gecos "" $USER
RUN adduser $USER sudo
RUN echo 'aliveos:aliveos' | chpasswd
RUN echo "source /opt/ros/foxy/setup.bash --" >> /home/aliveos/.bashrc
RUN mkdir -p $ALIVEOS_WS_DIR
RUN chown -R $USER $ALIVEOS_WS_DIR

# Set ssh key
RUN mkdir -p /home/$USER/.ssh/authorized_keys
# COPY docker/aliveos_container_rsa.pub /home/$USER/.ssh/authorized_keys
# RUN chown $USER /home/$USER/.ssh/authorized_keys
# RUN chown -R $USER:$USER /home/$USER/.ssh/authorized_keys
# RUN chmod 700 /home/$USER/.ssh/authorized_keys

# Add local sources
# COPY ./src /home/$USER/aliveos_ws/src
# RUN chown $USER -R /home/$USER/aliveos_ws

# Resolve dependencies
RUN rosdep install -i --from-path src --rosdistro foxy -y; exit 0

# ----------------------------------------------------------------------------
# Start
# ----------------------------------------------------------------------------
WORKDIR /home/aliveos/aliveos_ws
COPY aliveos_entrypoint.sh /aliveos_entrypoint.sh
ENTRYPOINT ["/aliveos_entrypoint.sh"]
CMD [ "/bin/bash" ]
