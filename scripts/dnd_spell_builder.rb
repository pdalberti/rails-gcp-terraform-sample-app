def spell_content(spell)
  "<spell
  title=\"#{spell.title}\"#{"\n  " + 'original="' + spell.original + '"' if spell.original}
  rulebook=\"#{spell.rulebook.join(', ')}\"
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
  Spell.sort_by_czech_title_asc.each do |spell|
    f.write(spell_content(spell))
  end
end
