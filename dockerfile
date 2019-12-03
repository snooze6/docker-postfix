FROM debian

COPY main.cf /etc/postfix/main.cf

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y postfix
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN /etc/init.d/postfix start
RUN /etc/init.d/postfix enable
RUN mkfifo /var/spool/postfix/public/pickup
RUN echo "Starting..." > /var/log/mail.log

EXPOSE 25/TCP

CMD ["tail -f /var/log/mail.log"]