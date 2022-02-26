FROM img-captain-direwolf20-1-16:3
RUN cd /minecraft && curl -SLO LINK_TO_DOWNLOAD \
    && rm -rf mods && tar xf download
# Archive contents: config  defaultconfigs mods

# With certbot fix
FROM registry:443/captain/img-captain-direwolf20-1-16
USER root
RUN sed -i 's/^mozilla\/DST_Root_CA_X3\.crt/!mozilla\/DST_Root_CA_X3.crt/g'  /etc/ca-certificates.conf && update-ca-certificates
USER minecraft
RUN cd /minecraft && curl -SLO https://next/index.php/s/MMMMMMMMXCCC/download \
    && rm -rf mods && tar xf download
# Archive contents: config  defaultconfigs mods
