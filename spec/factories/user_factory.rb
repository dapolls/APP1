FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "test12345"
    first_name "user1"
    last_name "tester"
    admin false
  end

  factory :admin, class: User do
    email
    password "test12345"
    admin true
    first_name "Admin"
    last_name "User"
  end
end