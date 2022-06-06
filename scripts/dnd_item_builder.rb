def item_content(item)
  "<dnd-item
  title=\"#{item.title}\"#{"\n  " + 'original="' + item.original + '"' if item.original}

  rulebook=\"#{item.rulebook.join(', ')}\"

  rarity=\"#{item.rarity}\"

  attunement=\"#{item.attunement.join(', ')}\"
  interaction=\"#{item.interaction}\"

  purpose=\"#{item.purpose.join(', ')}\"
  item=\"#{item.item.join(', ')}\"

  combat-effect=\"#{item.combat_effect.join(', ')}\"
  bonus=\"#{item.bonus.join(', ')}\"

  limit=\"#{item.limit.join(', ')}\"
  duration=\"#{item.duration}\"
  >

#{item.description.strip}
</dnd-item>\n\n"
end

File.open('storage/dnd-items.md', 'w') do |f|
  Dnd::Item.sort_by_czech_title_asc.each do |item|
    f.write(item_content(item))
  end
end
