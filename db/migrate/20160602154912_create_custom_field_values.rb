class CreateCustomFieldValues < ActiveRecord::Migration
  def change
    create_table :custom_field_values do |t|
      t.text :value
      t.string :label
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
