FROM ruby:2.4

ADD /. /app
WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

RUN npm install yarn
RUN yarn install
RUN bundle install

EXPOSE 3000:3000
EXPOSE 35729:35729

CMD ["make", "serve"] 
