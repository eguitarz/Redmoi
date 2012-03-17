class CreateGathers < ActiveRecord::Migration
  def change
    create_table :gathers do |t|
      t.string :user_id  
      t.string :title
      t.text :content
      t.text :description
      t.string :keyword
      t.string :url
      t.datetime :gather_time
      t.integer :gather_format_id
      t.boolean :visibility

      t.timestamps
    end
  end
end
