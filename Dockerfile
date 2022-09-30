FROM agramakov/aliveos:dev

ENV USER aliveos

# SSH
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22

# Add aliveos user
RUN adduser --disabled-password --gecos "" $USER
RUN adduser $USER sudo
RUN echo 'aliveos:aliveos' | chpasswd

# Set ssh key
RUN mkdir -p /home/$USER/.ssh/authorized_keys
# COPY docker/aliveos_container_rsa.pub /home/$USER/.ssh/authorized_keys
# RUN chown $USER /home/$USER/.ssh/authorized_keys
# RUN chown -R $USER:$USER /home/$USER/.ssh/authorized_keys
# RUN chmod 700 /home/$USER/.ssh/authorized_keys

# Add local sources
ADD ./src /aliveos_ws/src

# Resolve dependencies
RUN rosdep install -i --from-path src --rosdistro foxy -y; exit 0

# ----------------------------------------------------------------------------
# Start
# ----------------------------------------------------------------------------
COPY aliveos_entrypoint.sh /aliveos_entrypoint.sh
ENTRYPOINT ["/aliveos_entrypoint.sh"]
CMD [ "/bin/bash" ]
