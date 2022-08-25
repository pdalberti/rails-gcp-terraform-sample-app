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


{
  'dnd-items' => { split: 'dnd-item', class: 'Dnd::Item' },
  'fate-stunts' => { split: 'stunt', class: 'Fate::Trick' },
  'drd2-zs' => { split: 'drd2-zs', class: 'Drd2::Ability' }
}.each do |path, values|
  File.read("storage/#{path}.md").gsub("\r", '').split("<#{values[:split]}\n").each do |unsanitized_item|
    next if unsanitized_item.blank?

    unsanitized_item = unsanitized_item.gsub("</#{values[:split]}>", '').rstrip
    "#{values[:class]}SanitizerService".constantize.call(unsanitized_item)
  end

  puts "Created #{values[:class].constantize.count} #{values[:class].gsub('::', ' ').pluralize}"
end
