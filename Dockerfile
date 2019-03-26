FROM node:10

COPY . /chronicler-action

RUN cd /chronicler-action \
  && git clone https://github.com/nytimes/Chronicler.git \
  && cd Chronicler \
  && git checkout f0f93e681d4e73f262b9350b9841760293751e6a \
  && npm ci \
  && cd .. \
  && yarn

ENTRYPOINT ["/chronicler-action/entrypoint.sh"]

LABEL "com.github.actions.name"="Chronicler"
LABEL "com.github.actions.description"=" A better way to write your release notes."
LABEL "com.github.actions.icon"="edit-2"
LABEL "com.github.actions.color"="gray-dark"
