FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /depot
WORKDIR /depot
COPY Gemfile /depot/Gemfile
COPY Gemfile.lock /depot/Gemfile.lock
ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . /depot

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]