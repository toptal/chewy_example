# README

This is an example application for Toptal Blog acticle.
To try it:

* clone this repo
* `bundle install`
* `RAILS_ENV=test rake db:setup && rake spec` for tests
* `rake db:setup && rake chewy:reset:all && rails s` for trying

To fing ActsAsTaggableOn monkeypatches look at `config/initializers/acts_as_taggable_on.rb`
