class CreateDudes < ActiveRecord::Migration
  def change
    create_table :dudes do |t|
      t.string :name

      t.timestamps
    end
  end
end
