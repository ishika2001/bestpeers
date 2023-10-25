class CreateOrganizers < ActiveRecord::Migration[7.0]
  def change
    create_table :organizers do |t|
      t.string :email,              null: false, default: ""
      t.string :name, null: false, default: ""
      t.timestamps
    end
  end
end
