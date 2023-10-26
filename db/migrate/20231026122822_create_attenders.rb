class CreateAttenders < ActiveRecord::Migration[7.0]
  def change
    create_table :attenders do |t|
      t.string :name
      t.integer :contact
      t.integer :age
      t.references :event, null: false, foreign_key: true
      t.timestamps
    end
  end
end
