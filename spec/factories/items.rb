# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    quantity 1
    totalTF "9.99"
    tva "9.99"
  end
end
