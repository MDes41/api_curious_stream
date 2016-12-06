FactoryGirl.define do
  factory :tweet do
    msg "MyString"
    likes 1
    user nil
  end
end
