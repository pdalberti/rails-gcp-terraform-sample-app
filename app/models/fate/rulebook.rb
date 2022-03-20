# == Schema Information
#
# Table name: fate_rulebooks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module Fate
  class Rulebook < ApplicationRecord
  end
end
