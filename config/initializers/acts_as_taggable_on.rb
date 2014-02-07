ActsAsTaggableOn::Tag.class_eval do
  has_many :books, through: :taggings, source: :taggable, source_type: 'Book'
  has_many :videos, through: :taggings, source: :taggable, source_type: 'Video'

  update_index 'entertainment#book', :books
  update_index('entertainment#movie') { videos.movies }
  update_index('entertainment#cartoon') { videos.cartoons }
end

ActsAsTaggableOn::Tagging.class_eval do
  update_index('entertainment#book') { taggable if taggable_type == 'Book' }
  update_index('entertainment#movie') { taggable if taggable_type == 'Video' && taggable.movie? }
  update_index('entertainment#cartoon') { taggable if taggable_type == 'Video' && taggable.cartoon? }
end
