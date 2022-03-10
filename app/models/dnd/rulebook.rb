# == Schema Information
#
# Table name: rulebooks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module Dnd
  class Rulebook < ApplicationRecord
    has_many :sources
    has_many :spells, through: :sources
  end
end
