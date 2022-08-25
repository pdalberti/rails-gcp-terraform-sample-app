require 'database_cleaner/active_record'

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# write your new seeds after this line

File.read('storage/dnd-spells.md').split("<spell\n").each do |unsanitized_spell|
  next if unsanitized_spell.blank?

  unsanitized_spell = unsanitized_spell.gsub('</spell>', '').rstrip
  Dnd::SpellSanitizerService.call(unsanitized_spell)
end

puts "Created #{Spell.count} DnD spells"


File.read('storage/dnd-items.md').gsub("\r", '').split("<dnd-item\n").each do |unsanitized_item|
  next if unsanitized_item.blank?

  unsanitized_item = unsanitized_item.gsub('</dnd-item>', '').rstrip
  Dnd::ItemSanitizerService.call(unsanitized_item)
end

puts "Created #{Dnd::Item.count} DnD items"


File.read('storage/fate-stunts.md').split("<stunt\n").each do |unsanitized_stunt|
  next if unsanitized_stunt.blank?

  unsanitized_stunt = unsanitized_stunt.gsub('</stunt>', '').rstrip
  Fate::TrickSanitizerService.call(unsanitized_stunt)
end

puts "Created #{Fate::Trick.count} Fate stunts"


File.read('storage/drd2-zs.md').gsub("\r", '').split("<drd2-zs\n").each do |unsanitized_ability|
  next if unsanitized_ability.blank?

  unsanitized_ability = unsanitized_ability.gsub('</drd2-zs>', '').rstrip
  Drd2::AbilitySanitizerService.call(unsanitized_ability)
end

puts "Created #{Drd2::Ability.count} DrD2 abilities"
