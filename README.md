Getting a dev version running:

`$ gem install bundler foreman rake`

`$ bundle`

`$ cp env .env`

Edit the .env file as required for your environment. Database details are only required if you're using the production environment.

`$ rake db:migrate`

Once you have tests (./spec) you can run these like:

`$ rspec`

Hopefully everything will be green.

Don't start the app with `$ rails s`, it has a clock and worker thread. Start it via:

`$ foreman start`

Compiling assets for commit before deployment:

`$ RAILS_ENV=production bundle exec rake assets:precompile`

Also of note (but unecessary in development mode):

`$ bundle exec rake assets:precompile`

`$ bundle exec rake tmp:cache:clear`

`$ foreman export --app appname --user root upstart /etc/init`

Cronjobs can be added via the clockwork gem, in ./libs/clock.rb

On a new Ubuntu 14.04 server:

    sudo rm /etc/nginx/sites-enabled/default

    sudo mkdir /var/www
    sudo mkdir /var/www/releases
    sudo mkdir /var/www/releases/learning-docs

    sudo chown -R root:www-data /var/www

    sudo mkdir /etc/learning-docs


    *** added my config file /etc/learning-docs/env-variables.conf

    *** added my nginx config @ /etc/nginx/sites-available/learning-docs


    sudo ln -s /etc/nginx/sites-available/learning-docs /etc/nginx/sites-enabled/learning-docs

    sudo service nginx restart


    *** other necessary dependencies

    sudo gem install bundler

    sudo apt-get install git

    sudo apt-get install build-essential

    sudo apt-get install zlib1g-dev

    sudo apt-get install imagemagick

    sudo apt-get install libmysqlclient-dev

    sudo apt-get install libssl-dev

    sudo apt-get install libreadline-dev

    sudo apt-get install libyaml-dev

    sudo apt-get install libsqlite3-dev sqlite3

    sudo apt-get install libxml2-dev

    sudo apt-get install libxslt1-dev

    sudo apt-get install libcurl4-openssl-dev

