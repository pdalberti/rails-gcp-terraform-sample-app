def spell_content(spell)
  "<spell
    title=\"#{spell.name}\"
    original=\"#{spell.en_name}\"
    rulebook=\"#{spell.rulebook}\"
    school=\"#{spell.school}\"
    level=\"#{spell.level}\"
    casting=\"#{Spell::CASTING.key(spell.casting)}\"
    range=\"#{Spell::RANGE.key(spell.range)}\"
    components=\"#{spell_components(spell)}\"
    duration=\"#{Spell::DURATION.key(spell.duration)}\"
    classes=\"#{spell.classes.join(', ')}\"
    >

  #{spell_description(spell)}
  </spell>\n\n"
end

def spell_components(spell)
  spell = File.read("storage/dnd/#{spell.name.parameterize}.md")
  spell.split('**Složky:**').last.split('**Trvání:**').first.strip
end

def spell_description(spell)
  spell.description.split('**Povolání:**').last.strip.split("\n")[2..].join("\n")
end

File.open('storage/dnd-spells.md', 'w') do |f|
  Spell.all.each do |spell|
    f.write(spell_content(spell))
  end
end
