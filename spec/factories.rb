FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    password 'P@ssw0rd!'
  end

  factory :photo do
    order 0
    status 0
    image { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
  end

end
