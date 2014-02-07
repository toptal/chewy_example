class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :kind
      t.string :title
      t.text :description
      t.integer :year
      t.integer :director_id

      t.timestamps
    end
  end
end
