# Use the latest version of the Alpine base image
FROM debian:latest

# Install the latest version of busybox
RUN apt update
RUN apt upgrade -y
RUN apt install curl -y
# add GPG key
RUN curl -s https://deb.frrouting.org/frr/keys.gpg | sudo tee /usr/share/keyrings/frrouting.gpg > /dev/null

# possible values for FRRVER: frr-6 frr-7 frr-8 frr-9.0 frr-9.1 frr-stable
# frr-stable will be the latest official stable release
RUN FRRVER="frr-stable"
RUN echo deb '[signed-by=/usr/share/keyrings/frrouting.gpg]' https://deb.frrouting.org/frr \
     $(lsb_release -s -c) $FRRVER | sudo tee -a /etc/apt/sources.list.d/frr.list

# update and install FRR
RUN sudo apt update && sudo apt install frr frr-pythontools
RUN apt install busybox -y
