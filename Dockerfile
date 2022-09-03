FROM lambci/lambda:build-ruby2.7


RUN yum -y update
RUN amazon-linux-extras enable postgresql10

RUN yum install -y postgresql postgresql-devel

RUN gem update bundler

ADD Gemfile /var/task/Gemfile
ADD Gemfile.lock /var/task/Gemfile.lock

RUN bundle config set clean 'true' && \
    bundle config set path '/var/task/vendor/bundle' && \
    bundle install

CMD "/bin/bash"
