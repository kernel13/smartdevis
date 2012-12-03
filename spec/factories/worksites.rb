# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :worksite do
    reason "MyString"
    description "MyText"
    work_start_on "2012-12-02"
    work_end_on "2012-12-02"
  end
end
