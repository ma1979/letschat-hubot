FROM mongo:latest
MAINTAINER ma1979
RUN apt-get update && apt-get install -y wget
RUN cd /tmp && wget https://github.com/ma1979/letschat-hubot/raw/master/letschat-hubot-mongo-initial.gz
RUN echo "#!/bin/bash" > /tmp/restore.sh
RUN echo "sleep 5 && mongorestore --gzip --archive=/tmp/letschat-hubot-mongo-initial.gz --db letschat & " >> /tmp/restore.sh
RUN echo "docker-entrypoint.sh mongod" >> /tmp/restore.sh
RUN chmod 777 /tmp/restore.sh
CMD sh /tmp/restore.sh