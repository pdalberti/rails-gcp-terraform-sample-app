require 'database_cleaner/active_record'
require 'open-uri'
require_relative '../app/services/application_service'
require_relative '../app/services/spell_sanitizer_service'

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# write your new seeds after this line

paths = %w[storage/11-kapitola-a.md storage/11-kapitola-b.md]
paths.each do |path|
  f = File.open(path).read
  f = f.split('### ')[1..] # split by spell title and select only spells
  f.each { |spell| SpellSanitizerService.call(spell) }
end

puts "Created #{Spell.count} spells"
