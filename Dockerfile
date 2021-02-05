FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -yq ruby ruby-dev build-essential git
RUN gem install --no-ri --no-rdoc bundler -v 1.14.6
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN cd /app; bundle install
ADD . /app
EXPOSE 4567
WORKDIR /app
CMD ["bash"]
