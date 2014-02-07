class Book < ActiveRecord::Base
  acts_as_taggable

  belongs_to :author, class_name: 'Dude'
  update_index 'entertainment#book', :self
end
