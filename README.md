# README

This is an example application using the Chewy gem extension to Elasticsearch.
Application updated to work with ElasticSearch 1.0.0 version and later.
To try it:

* Install ElasticSearch >= 1.0.0
* Clone this repo
* `bundle install`
* `RAILS_ENV=test rake elasticsearch:start db:setup && rake spec` for tests
* `rake db:setup && rake chewy:reset:all && rails s` for trying

To find ActsAsTaggableOn monkeypatches look at the `config/initializers/acts_as_taggable_on.rb`
