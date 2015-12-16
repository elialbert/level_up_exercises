FactoryGirl.define do
  factory :favorite do
    association :menu_item
    association :user
  end
end
