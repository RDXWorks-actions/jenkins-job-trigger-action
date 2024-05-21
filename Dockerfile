FROM ruby

WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY jenkins jenkins

COPY entrypoint.sh entrypoint.sh
RUN chmod +x ./entrypoint.sh

COPY jenkins_job.rb jenkins_job.rb

RUN curl -fsSL https://tailscale.com/install.sh | sh

RUN bundle install

ENTRYPOINT [ "/app/entrypoint.sh" ]
