# Use the latest version of the Alpine base image
FROM frrouting/frr
RUN apk add --no-cache busybox

RUN apk update
RUN apk add nano

# Copy the modified daemons file
COPY daemons /etc/frr/daemons

# Ensure the daemons file has the correct permissions
RUN chown frr:frr /etc/frr/daemons && chmod 644 /etc/frr/daemons

# Copy the modified daemons file
COPY vtysh.conf /etc/frr/vtysh.conf

# Ensure the vtysh.conf file has the correct permissions
RUN chown frr:frr /etc/frr/vtysh.conf && chmod 644 /etc/frr/vtysh.conf

# Copy the modified daemons file
COPY frr.conf /etc/frr/frr.conf

# Ensure the vtysh.conf file has the correct permissions
RUN chown frr:frr /etc/frr/frr.conf && chmod 644 /etc/frr/frr.conf

# Set the command to start FRR services
# CMD ["zebra", "bgpd", "ospfd", "isisd", "watchfrr"]