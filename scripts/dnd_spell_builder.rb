def spell_content(spell)
  "<spell
    title=\"#{spell.name}\"
    original=\"#{spell.en_name}\"
    rulebook=\"#{spell.rulebook}\"
    school=\"#{spell.school}\"
    level=\"#{spell.level}\"
    ritual=\"#{spell.ritual}\"
    casting=\"#{spell.original_casting}\"
    range=\"#{spell.original_range}\"
    components=\"#{spell.original_components}\"
    duration=\"#{spell.original_duration}\"
    concentration=\"#{spell.concentration}\"
    classes=\"#{spell.classes.join(', ')}\"
    >

  #{spell_description(spell)}
  </spell>\n\n"
end

def spell_description(spell)
  spell.description.split('**Povolání:**').last.strip.split("\n")[2..].join("\n")
end

File.open('storage/dnd-spells.md', 'w') do |f|
  Spell.all.each do |spell|
    f.write(spell_content(spell))
  end
end
