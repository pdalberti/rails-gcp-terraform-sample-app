require 'database_cleaner/active_record'
require 'open-uri'
require_relative '../app/services/application_service'
require_relative '../app/services/spell_sanitizer_service'

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# write your new seeds after this line

classes = %w[bard druid hraničář klerik kouzelník paladin čaroděj černokněžník].map do |name|
  { name: name }
end
DndClass.insert_all!(classes)

puts "Created #{classes.join(', ')} classes"

paths = Dir['storage/*.md']
paths.each do |path|
  file = File.open(path).read
  SpellSanitizerService.call(file)
end

puts "Created #{Spell.count} spells"
