require 'database_cleaner/active_record'
require_relative '../app/services/application_service'
require_relative '../app/services/spell_sanitizer_service'

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# write your new seeds after this line

# puts 'Setting up DnD Compendium'

# classes = %w[Bard Čaroděj Černokněžník Druid Hraničář Klerik Kouzelník Paladin]
# classes.each { |klass| DndClass.create!(name: klass) }

# puts "Created #{classes.join(', ')} classes"

# paths = Dir['storage/*.md'].sort
# paths.each do |path|
#   file = File.read(path)
#   SpellSanitizerService.call(file)
# end

# puts "Created #{Spell.count} spells"


puts 'Setting up Fate Compendium'

rulebooks = ['Základní pravidla', 'Zrychlená pravidla', 'Systémové nástroje', 'Fate SW', 'Převodní příručka']
rulebooks.each { |rulebook| Fate::Rulebook.create!(name: rulebook) }

puts "Created #{rulebooks.join(', ')} rulebooks"

chapters = {
  'FC S0' => 'Základní pravidla',
  'FC E' => 'Základní pravidla',
  'FA A0' => 'Zrychlená pravidla',
  'SW S0' => 'Fate SW',
  'SW C0' => 'Fate SW',
  'SW R0' => 'Fate SW',
  'SW E' => 'Fate SW',
  'SW En' => 'Fate SW'
}
chapters.each { |name, rulebook| Fate::Chapter.create!(name: name, fate_rulebook: Fate::Rulebook.find_by(name: rulebook)) }

puts "Created #{chapters.keys.join(', ')} chapters"

trick = Fate::Trick.create!(
  name: 'Gravitační akrobacie',
  fate_rulebook: Fate::Rulebook.find_by(name: 'Fate SW')
)
Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'FC S0'),
  name: 'Atletika'
)

Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'SW S0'),
  name: 'Atletika'
)


trick = Fate::Trick.create!(
  name: 'Bitevní orientace',
  fate_rulebook: Fate::Rulebook.find_by(name: 'Fate SW')
)
Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'FC S0'),
  name: 'Střelba'
)

Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'SW S0'),
  name: 'Atletika'
)


trick = Fate::Trick.create!(
  name: 'Lovecká zkušenost',
  fate_rulebook: Fate::Rulebook.find_by(name: 'Fate SW')
)
Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'FC S0'),
  name: 'Vyšetřování'
)

Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'SW C0'),
  name: 'Lovec odměn'
)


trick = Fate::Trick.create!(
  name: 'Nepředvídatelná povaha',
  fate_rulebook: Fate::Rulebook.find_by(name: 'Fate SW')
)
Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'SW R0'),
  name: 'Lidé'
)

Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'SW R0'),
  name: "Twi'lekové"
)


trick = Fate::Trick.create!(
  name: 'Základní pravidla',
  fate_rulebook: Fate::Rulebook.find_by(name: 'Fate SW')
)
Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'FC S0'),
  name: 'Skrývání'
)

Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'SW S0'),
  name: 'Infiltrace'
)


# create tricks and assign dials
# create search page to test ransack
