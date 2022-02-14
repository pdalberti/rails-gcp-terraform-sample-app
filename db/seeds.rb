require 'database_cleaner/active_record'
require_relative '../app/services/application_service'
require_relative '../app/services/spell_sanitizer_service'

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# write your new seeds after this line

classes = %w[Bard Čaroděj Černokněžník Druid Hraničář Klerik Kouzelník Paladin]
classes.each { |klass| DndClass.create!(name: klass) }

puts "Created #{classes.join(', ')} classes"

rulebooks = ['Dobrodruhův průvodce Mečovým prostředím', 'Příručka hráče', 'Xanatharuv pruvodce vším']
rulebooks.each { |rulebook| Rulebook.create!(name: rulebook) }

puts "Created #{rulebooks.join(', ')} rulebooks"

paths = Dir['storage/*.md'].sort
paths.each do |path|
  file = File.open(path).read
  SpellSanitizerService.call(file)
end

puts "Created #{Spell.count} spells"
