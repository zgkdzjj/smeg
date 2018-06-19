FactoryGirl.define do
  factory :product do
    sequence(:model_number)      { |n| "#{n}12345" }
    description     "MyText"
    warranty        "MyText"
    type            "Stove"
  end
end
