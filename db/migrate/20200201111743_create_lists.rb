class CreateLists < ActiveRecord::Migration
  def change
    create_table :list do |t|
      t.string :title
      t.string :content
    end
  end
end
