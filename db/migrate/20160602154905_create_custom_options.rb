class CreateCustomOptions < ActiveRecord::Migration
  def change
    create_table :custom_options do |t|
      t.string :option
      t.references :custom_field, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
