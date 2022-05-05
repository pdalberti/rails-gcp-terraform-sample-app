module PagesHelper
  def psql_array_czech_sort(array)
    collator.sort(array.flatten.uniq)
  end

  def collator
    ::TwitterCldr::Collation::Collator.new(:cz)
  end

  def fate_trick_description(trick)
    description = "# #{trick.title}"
    description += "\n*#{trick.original}*" if trick.original
    description += "\n\n***#{trick.source}***\n"
    description += "\n\n**FAE přístup:** #{trick.fae_approach.join(', ')}" unless trick.fae_approach.blank?
    description += "\n\n**FC specialita:** #{trick.fc_extra.join(', ')}" unless trick.fc_extra.blank?
    description += "\n\n**FC dovednost:** #{trick.fc_skill.join(', ')}" unless trick.fc_skill.blank?
    description += "\n\n**SW archetyp:** #{trick.sw_archetype.join(', ')}" unless trick.sw_archetype.blank?
    description += "\n\n**SW protivník:** #{trick.sw_enemy.join(', ')}" unless trick.sw_enemy.blank?
    description += "\n\n**SW specialita:** #{trick.sw_extra.join(', ')}" unless trick.sw_extra.blank?
    description += "\n\n**SW rasa:** #{trick.sw_race.join(', ')}" unless trick.sw_race.blank?
    description += "\n\n**SW dovednost:** #{trick.sw_skill.join(', ')}" unless trick.sw_skill.blank?
    description += "\n\n**Tagy:** #{trick.tags.join(', ')}" unless trick.tags.blank?
    description += "\n\n**Typ:** #{trick.trick_type.join(', ')}" unless trick.trick_type.blank?
    description += "\n\n**Akce:** #{trick.actions.join(', ')}" unless trick.actions.blank?
    description += "\n\n**Omezení:** #{trick.restrictions.join(', ')}" unless trick.restrictions.blank?
    description += "\n\n**Cena:** #{trick.costs.join(', ')}" unless trick.costs.blank?
    description += "\n\n#{trick.description}"
    description
  end
end
