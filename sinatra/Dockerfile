FROM ruby:2.7.0

RUN addgroup --gid 1000 app && \
    adduser --uid 1000 --ingroup app --disabled-password --gecos "" app
USER app

WORKDIR /app

RUN gem install bundler -v 2.1.4

COPY --chown=app:app app/Gemfile app/Gemfile.lock /app/

RUN bundle install --jobs=4

STOPSIGNAL SIGINT

COPY --chown=app:app app/ /app

EXPOSE 8000

# https://nickjanetakis.com/blog/docker-tip-63-difference-between-an-array-and-string-based-cmd
CMD ["rackup", "--port", "8000", "--host", "0.0.0.0", "-E", "production"]
