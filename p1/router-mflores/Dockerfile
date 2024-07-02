# Use the latest version of the Alpine base image
FROM frrouting/frr
RUN apk add --no-cache busybox

RUN $pwd
RUN apk update
RUN apk add nano
WORKDIR /etc/frr/
COPY daemons /etc/frr/daemons

# RUN echo 

# ENTRYPOINT ["busybox"]


