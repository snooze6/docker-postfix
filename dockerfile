FROM debian

COPY main.cf /etc/postfix/main.cf

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y postfix
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkfifo /var/spool/postfix/public/pickup
RUN postconf maillog_file=/var/log/mail.log
RUN ip addr > /var/log/mail.log
RUN postfix reload
RUN postfix start

EXPOSE 25/TCP

CMD tail -f /var/log/mail.log