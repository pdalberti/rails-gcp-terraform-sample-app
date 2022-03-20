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

paths = Dir['storage/*.md'].sort
paths.each do |path|
  file = File.read(path)
  SpellSanitizerService.call(file)
end

puts "Created #{Spell.count} spells"


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
  trick_type: '+2, -aspekty/vynucení',
  action: 'O, CA',
  description: 'Tvoje zkušenosti se stavem beztíže ti dávají ohromnou orientaci ve 3D prostoru. Máš +2 k hodům na Překonání nebo Vytvoření výhody kdykoliv, kdy jednáš během skoku, pádu nebo letu. Prostředí bez gravitace ti nečiní žádné problémy (situační aspekty, které se k němu váží, můžeš ignorovat a nejdou proti tobě vyvolat ani vynutit).',
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
  trick_type: '+akce, -aspekty/vynucení',
  action: 'D',
  description: 'Že na tebe někdo střílí je pro tebe normální a střely, které tě těsně minou, tě už nevzrušují. Máš tak čas dívat se okolo, jednat s chladnou efektivitou a využívat vlastní střelbu k zastrašení těch, kteří tvůj klid nesdílejí. Můžeš použít Blastery k obraně před nepřátelskou střelbou, za předpokladu, že na protivníka můžeš střílet zpátky. Pokud se můžeš krýt svou střelbou, můžeš ignorovat situační aspekty související s volným prostranstvím a máš +2 k obraně před riziky prostředí založenými na intenzitě okolní palby.',
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
  trick_type: '+schopnost',
  description: 'Pokud se alespoň rámcově seznámíš s profilem (osobností, schopnostmi) cíle, který pronásleduješ, pak dokážeš odhadnout, kam se vydal dál, jen na základě znalosti situace, v níž se nacházel (zdroje, možnosti, čas...).',
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
  trick_type: '+schopnost',
  restriction: '1/sezení',
  description: 'Jednou za sezení, když se rozhodneš jednat v rozporu se svým aspektem postavy (včetně na tobě umístěných situačních aspektů psychické povahy typu „zastrašený“ atp., ale nikoliv aspektů vzešlých ze Síly a aspektů zkorumpovaných Temnou stranou) a někdo se tě vynucením pokusí přimět chovat v souladu s aspektem, můžeš takové vynucení zdarma odmítnout.',
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
  name: 'Odhalování lží',
  en_name: 'Lie Whisperer',
  trick_type: '+2p',
  description: '+2 na všechny hody na Empatii, které jsou činěny za účelem odhalení lží, ať už jsou cíleny na vás nebo na někoho jiného.',
  fate_rulebook: Fate::Rulebook.find_by(name: 'Základní pravidla')
)
Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'FC S0'),
  name: 'Empatie'
)

Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'SW S0'),
  name: 'Přesvědčování'
)

Fate::Dial.create!(
  fate_trick: trick,
  fate_chapter: Fate::Chapter.find_by(name: 'SW S0'),
  name: 'Pozornost'
)


trick = Fate::Trick.create!(
  name: 'Omračující protiúder',
  en_name: 'Dazing Counter',
  trick_type: '+2p, +možnost',
  action: 'D',
  description: 'Když uspějete stylově při obraně proti protivníkovu hodu na Boj, automaticky mu vracíte omračující ránu nebo nějaký typ nervového úderu. Přidělte oponentovi situační aspekt _**Omráčený**_ s volným vyvoláním namísto obyčejného posílení.',
  fate_rulebook: Fate::Rulebook.find_by(name: 'Základní pravidla')
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

puts "Created #{Fate::Trick.count} tricks"
