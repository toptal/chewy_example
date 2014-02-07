class Video < ActiveRecord::Base
  acts_as_taggable

  belongs_to :director, class_name: 'Dude'
  update_index('entertainment#movie') { self if movie? }
  update_index('entertainment#cartoon') { self if cartoon? }

  validates :kind, inclusion: {in: %w(movie cartoon)}

  scope :movies, ->{ where(kind: 'movie') }
  scope :cartoons, ->{ where(kind: 'cartoon') }

  def movie?
    kind == 'movie'
  end

  def cartoon?
    kind == 'cartoon'
  end
end
