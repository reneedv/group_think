FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@groupe.com" }
    password "notyourbusiness"
    password_confirmation "notyourbusiness"
  end
end
