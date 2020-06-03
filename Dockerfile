FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /lancer-connect
WORKDIR /lancer-connect
RUN gem install nokogiri:1.10.9
COPY Gemfile /lancer-connect/Gemfile
COPY Gemfile.lock /lancer-connect/Gemfile.lock
RUN bundle install
COPY . /lancer-connect

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0", "-P", "/tmp/puma.pid"]
