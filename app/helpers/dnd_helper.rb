module DndHelper
  def dnd_spell_description(spell)
    description = "# #{spell.title}"
    description += "\n*#{spell.original}*" if spell.original
    description += "\n\n***#{spell.rulebook}***\n"
    description += "\n\n*#{spell.school} #{spell.level}. úrovně#{' (rituál)' if spell.ritual}*"
    description += "\n\n**Vyvolání:** #{spell.original_casting}"
    description += "\n\n**Dosah:** #{spell.original_range}"
    description += "\n\n**Složky:** #{spell.original_components}"
    description += "\n\n**Trvání:** #{spell.original_duration}"
    description += "\n\n**Povolání:** #{spell.classes.join(', ')}"
    description += "\n\n#{spell.description}"
    description
  end
end
