FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    password 'P@ssw0rd!'
  end

end
