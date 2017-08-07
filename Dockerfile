FROM ruby:2.4

ADD /. /app
WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

RUN npm install
RUN bundle install

CMD ["make", "serve"] 
