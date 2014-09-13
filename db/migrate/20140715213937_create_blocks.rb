class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :title
      t.text :text
      t.integer :todo

      t.timestamps
    end
  end
end
