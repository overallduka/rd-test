class CustomField < ActiveRecord::Base
  belongs_to :user
  has_many :custom_options, dependent: :destroy

  enum custom_field_type: [
    :text,
    :text_area,
    :combo_box
  ]

end
