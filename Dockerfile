FROM debian:stable-slim

COPY gai.conf /etc/gai.conf

RUN apt-get update
RUN apt-get install -y bzip2 cron xargs find rsync ssh

COPY cron-entry.sh /entrypoint.d/cron-entry.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
CMD [ "cron", "-f"]