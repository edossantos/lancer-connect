FROM ruby:latest

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    nodejs \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

# Pre-install gems with native extensions
RUN gem install nokogiri -v "1.6.8.1"

RUN mkdir /lancer-connect
WORKDIR /lancer-connect
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
