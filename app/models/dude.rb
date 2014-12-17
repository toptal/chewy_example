class Dude < ActiveRecord::Base
  acts_as_taggable

  has_many :books, foreign_key: :author_id
  has_many :videos, foreign_key: :director_id
  update_index 'entertainment#book', :books
  update_index('entertainment#movie') { videos.movies }
  update_index('entertainment#cartoon') { videos.cartoons }
end
