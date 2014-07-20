class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body

      # this line adds an integer column called block_id
      t.references :block, index: true

      t.timestamps
    end
  end
end
