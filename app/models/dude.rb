class Dude < ActiveRecord::Base
  acts_as_taggable

  has_many :books
  has_many :videos
  update_index 'entertainment#book', :books
  update_index('entertainment#movie') { videos.movies }
  update_index('entertainment#cartoon') { videos.cartoons }
end
