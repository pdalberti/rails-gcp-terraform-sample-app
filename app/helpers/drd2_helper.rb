module Drd2Helper
  def ability_description(ability)
    description = "# #{ability.name}"
    description += "\n\n***#{ability.rulebook}***\n"
    description += "\n\n#{ability.description}"
    description
  end
end
