class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.date :date, null: false
      t.integer :price, null: false
      t.string :category1, null: false
      t.string :category2, null: false
      t.string :article

      t.timestamps
    end
  end
end
