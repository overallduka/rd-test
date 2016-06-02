class CustomField < ActiveRecord::Base
  belongs_to :user
  has_many :custom_options
end
