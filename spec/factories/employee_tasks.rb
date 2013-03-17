# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee_task do
    employee_id 1
    worksite_id 1
    price "9.99"
  end
end
