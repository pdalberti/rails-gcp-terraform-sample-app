FactoryBot.define do
  factory :dnd_item, class: 'Dnd::Item' do
    title { "MyString" }
    original { "MyString" }
    rulebook { "MyString" }
    rarity { "MyString" }
    filter_rarity { 1 }
    attunement { "MyString" }
    interaction { "MyString" }
    purpose { "MyString" }
    item { "MyString" }
    combat_effect { "MyString" }
    bonus { "MyString" }
    limit { "MyString" }
    duration { "MyString" }
  end
end
