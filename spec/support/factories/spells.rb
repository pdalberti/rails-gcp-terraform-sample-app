FactoryBot.define do
  factory :spell do
    name { "MyString" }
    school { "MyString" }
    level { 1 }
    casting { "MyString" }
    range { "MyString" }
    components { "MyString" }
    duration { "MyString" }
    description { "MyString" }
    ritual { false }
    concentration { false }
  end
end
