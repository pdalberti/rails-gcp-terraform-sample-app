# == Schema Information
#
# Table name: spells
#
#  id            :bigint           not null, primary key
#  casting       :integer
#  components    :string
#  concentration :boolean
#  description   :string
#  duration      :integer
#  en_name       :string
#  level         :integer
#  name          :string
#  range         :integer
#  ritual        :boolean
#  school        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Spell < ApplicationRecord
  has_many :class_spells
  has_many :dnd_classes, through: :class_spells
  has_many :sources
  has_many :rulebooks, through: :sources

  enum casting: {
    '1 reakce' => 0, '1 bonusová akce' => 1, '1 akce' => 2, '1 akce, nebo 8 hodin' => 3,
    '1 minuta' => 4, '10 minut' => 5, '1 hodina' => 6, '8 hodin' => 7, '12 hodin' => 8,
    '24 hodin' => 9
  }

  enum range: {
    'Ty sám' => 0, 'Ty sám (oblast)' => 1, 'Dotyk' => 2, '1 sáh' => 3, '2 sáhy' => 4,
    '3 sáhy' => 5, '6 sáhů' => 6, '10 sáhů' => 7, '12 sáhů' => 8, '18 sáhů' => 9,
    '20 sáhů' => 10, '24 sáhů' => 11, '30 sáhů' => 12, '60 sáhů' => 13, '100 sáhů' => 14,
    'Dohled' => 15, '1 míle' => 16, '800 mil' => 17, 'Neomezený' => 18, 'Zvláštní' => 19
  }

  enum duration: {
    'Ihned' => 0, 'Ihned, nebo 1 hodina' => 1, '1 kolo' => 2, '6 kol' => 3, '1 minuta' => 4,
    '10 minut' => 5, '1 hodina' => 6, '2 hodiny' => 7, '8 hodin' => 8, '24 hodin' => 9,
    '1 den' => 10, '7 dní' => 11, '10 dní' => 12, '30 dní' => 13, 'Do rozptýlení' => 14,
    'Do rozptýlení, nebo spuštění' => 15, 'Zvláštní' => 16
  }
end
