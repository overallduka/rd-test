FactoryGirl.define do

  factory :contact do
    email  FFaker::Internet.email 
    name   FFaker::Name.name 
    user   nil 
  end

end
