FROM node
MAINTAINER ma1979

RUN npm install -g yo generator-hubot
RUN npm list -g yo generator-hubot
RUN useradd bot
RUN mkdir /home/bot && chown bot.bot /home/bot

USER bot
WORKDIR /home/bot
RUN  yo hubot --owner "ma1979" --name "bot" --description "Hubot image" --adapter lets-chat

RUN echo "#!/bin/bash" > /home/bot/run_hubot.sh
RUN echo "bin/hubot --adapter lets-chat" >> /home/bot/run_hubot.sh

RUN chmod 777 /home/bot/run_hubot.sh

CMD cd /home/bot; sh run_hubot.sh