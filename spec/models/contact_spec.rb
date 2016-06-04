require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :custom_field_values }
  it { is_expected.to validate_presence_of :email }
end
