def spell_content(spell)
  "<spell
    title=\"#{spell.title}\"
    original=\"#{spell.original}\"
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

  #{spell.description.strip}
  </spell>\n\n"
end

File.open('storage/dnd-spells.md', 'w') do |f|
  Spell.all.each do |spell|
    f.write(spell_content(spell))
  end
end
