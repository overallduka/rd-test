require 'rails_helper'

RSpec.describe CustomFieldValue, type: :model do
  it { is_expected.to belong_to :contact }  
end
