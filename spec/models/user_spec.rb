require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :custom_fields }    
  it { is_expected.to have_many :contacts }    
end
