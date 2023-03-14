class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :name, null: false
      t.integer :quantity, null: false
      t.date :expiration_date, null: false
      t.text :memo
      t.references :user, null: false, foreign_key: true  # user_idカラムの作成

      t.timestamps
    end
  end
end
