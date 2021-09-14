FROM honkit/honkit

RUN apt-get update
RUN apt-get install -y build-essential openjdk-8-jre graphviz
RUN apt-get install -y fonts-ipafont fonts-ipaexfont

WORKDIR /doc

COPY ./package.json ./package.json
RUN yarn

COPY . .

CMD [ "/bin/bash", "-c", "npx honkit build" ]
