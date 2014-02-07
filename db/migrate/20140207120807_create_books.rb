class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.integer :author_id

      t.timestamps
    end
  end
end
