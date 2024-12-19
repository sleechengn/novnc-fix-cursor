FROM rockylinux:9.1.20230215
RUN dnf install -y epel-release
RUN dnf install -y novnc which procps net-tools

RUN sed -i "s/.*this\._target\.style\.cursor\s*\=.*url.*hotx.*hoty.*/this._target.style.cursor = \'default\'\;/g" /usr/share/novnc/core/util/cursor.js

ENV vnc=
COPY ./start.sh /
RUN chmod 777 /start.sh
EXPOSE 80/tcp
ENTRYPOINT /start.sh

