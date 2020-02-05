class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.integer :user_id
      t.integer :list_id
      t.string :name
      t.string :genre
      t.string :overview
    end
  end
end
