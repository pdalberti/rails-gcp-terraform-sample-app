require 'database_cleaner/active_record'
require_relative '../app/services/application_service'
require_relative '../app/services/spell_sanitizer_service'

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# write your new seeds after this line

puts 'Setting up DnD Compendium'

classes = %w[Bard Čaroděj Černokněžník Druid Hraničář Klerik Kouzelník Paladin]
classes.each { |klass| DndClass.create!(name: klass) }

puts "Created #{classes.join(', ')} classes"

paths = Dir['storage/dnd/*.md'].sort
paths.each do |path|
  file = File.read(path)
  SpellSanitizerService.call(file)
end

puts "Created #{Spell.count} spells"


puts 'Setting up Fate Compendium'

rulebooks = ['Základní pravidla', 'Zrychlený Fate', 'Systémové nástroje', 'Fate Epizoda I: Star Wars', 'Převodní příručka']
rulebooks.each { |rulebook| Fate::Rulebook.create!(name: rulebook) }

puts "Created #{rulebooks.join(', ')} rulebooks"

chapters = {
  'FC S0' => 'Základní pravidla',
  'FC E' => 'Základní pravidla',
  'FA A0' => 'Zrychlený Fate',
  'SW S0' => 'Fate Epizoda I: Star Wars',
  'SW C0' => 'Fate Epizoda I: Star Wars',
  'SW R0' => 'Fate Epizoda I: Star Wars',
  'SW E0' => 'Fate Epizoda I: Star Wars',
  'SW En' => 'Fate Epizoda I: Star Wars'
}
chapters.each { |name, rulebook| Fate::Chapter.create!(name: name, fate_rulebook: Fate::Rulebook.find_by(name: rulebook)) }

puts "Created #{chapters.keys.join(', ')} chapters"

paths = Dir['storage/fate/*.md'].sort
paths.each do |path|
  file = File.read(path)
  file.split('# ').each do |unsanitized_trick|
    next if unsanitized_trick.blank?

    TrickSanitizerService.call(unsanitized_trick)
  end
end

puts "Created #{Fate::Trick.count} tricks"
