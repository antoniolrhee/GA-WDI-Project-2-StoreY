class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
