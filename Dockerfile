FROM ruby:latest 
RUN mkdir /usr/src/app
ADD . /usr/src/app/ 
WORKDIR /usr/src/app/ 
RUN chown -R nobody:nogroup /usr/src/app/ 
RUN bundle install
CMD ["ruby", "/usr/src/app/main.rb"]

