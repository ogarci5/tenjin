# tenjin
#
# VERSION               0.0.1

FROM zaiste/ruby
MAINTAINER Evan Gray <evan@evanscottgray.com>

RUN 	apt-get update && apt-get install -y --fix-missing git nodejs mysql-client libmysqlclient-dev libsqlite3-dev libcurl4-openssl-dev libpcre3-dev curl wget imagemagick file
RUN	    gem install bundle

ENTRYPOINT 	bundle config --global jobs 3 && git clone https://github.com/ogarci5/tenjin && cd tenjin && bundle install && if ! [ X"$RAILS_ENV" = X"production" ]; then echo "Not Prod DB, Seeding sqlite DB" && rake db:schema:load; else echo 'Prod, not Seeding DB'; fi && passenger start

EXPOSE	3000