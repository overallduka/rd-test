require 'rails_helper'

RSpec.describe CustomOption, type: :model do
  it { is_expected.to belong_to :custom_field }    
end
