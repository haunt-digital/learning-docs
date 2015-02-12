# $ foreman export upstart /etc/init
# http://blog.daviddollar.org/2011/05/06/introducing-foreman.html
# clock: bundle exec clockwork lib/clock.rb

web: bundle exec puma -C config/puma.rb
delayed: bundle exec rake jobs:work
