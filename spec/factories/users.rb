FactoryGirl.define do
  factory :user do
    email "user@blocitoff.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Date.today
  end
end
