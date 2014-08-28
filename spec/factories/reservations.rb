# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    table
    start_time Time.now + 1.hours
    end_time Time.now + 2.hours
  end
end
