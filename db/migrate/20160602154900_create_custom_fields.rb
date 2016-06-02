class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :label
      t.references :user, index: true, foreign_key: true
      t.integer :custom_field_type

      t.timestamps null: false
    end
  end
end
