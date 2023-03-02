class CreateStampCards < ActiveRecord::Migration[7.0]
  def change
    create_table :stamp_cards do |t|
      t.integer :max_amount
      t.string :discount_item
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
