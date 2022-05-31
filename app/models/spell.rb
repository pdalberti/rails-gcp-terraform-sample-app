# == Schema Information
#
# Table name: spells
#
#  id                  :bigint           not null, primary key
#  casting             :integer
#  classes             :string           default([]), is an Array
#  components          :string
#  concentration       :boolean
#  description         :string
#  duration            :integer
#  level               :integer
#  original            :string
#  original_casting    :string
#  original_components :string
#  original_duration   :string
#  original_range      :string
#  range               :integer
#  ritual              :boolean
#  rulebook            :string
#  school              :string
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Spell < ApplicationRecord
  scope :sort_by_czech_name_asc, -> { sort { |a, b| Spell.collator.compare(a.name, b.name) } }
  scope :sort_by_czech_name_desc, -> { sort { |a, b| Spell.collator.compare(b.name, a.name) } }
  scope :sort_by_school_and_name_asc, lambda {
    sort do |a, b|
      [Spell.collator.get_sort_key(a.school), Spell.collator.get_sort_key(a.name)] <=>
        [Spell.collator.get_sort_key(b.school), Spell.collator.get_sort_key(b.name)]
    end
  }
  scope :sort_by_school_and_name_desc, lambda {
    sort do |a, b|
      [Spell.collator.get_sort_key(b.school), Spell.collator.get_sort_key(a.name)] <=>
        [Spell.collator.get_sort_key(a.school), Spell.collator.get_sort_key(b.name)]
    end
  }
  scope :sort_by_level_and_name_asc, lambda {
    sort do |a, b|
      [a.level, Spell.collator.get_sort_key(a.name)] <=> [b.level, Spell.collator.get_sort_key(b.name)]
    end
  }
  scope :sort_by_level_and_name_desc, lambda {
    sort do |a, b|
      [b.level, Spell.collator.get_sort_key(a.name)] <=> [a.level, Spell.collator.get_sort_key(b.name)]
    end
  }
  scope :sort_by_casting_and_name_asc, lambda {
    sort do |a, b|
      [a.casting, Spell.collator.get_sort_key(a.name)] <=> [b.casting, Spell.collator.get_sort_key(b.name)]
    end
  }
  scope :sort_by_casting_and_name_desc, lambda {
    sort do |a, b|
      [b.casting, Spell.collator.get_sort_key(a.name)] <=> [a.casting, Spell.collator.get_sort_key(b.name)]
    end
  }
  scope :sort_by_range_and_name_asc, lambda {
    sort do |a, b|
      [a.range, Spell.collator.get_sort_key(a.name)] <=> [b.range, Spell.collator.get_sort_key(b.name)]
    end
  }
  scope :sort_by_range_and_name_desc, lambda {
    sort do |a, b|
      [b.range, Spell.collator.get_sort_key(a.name)] <=> [a.range, Spell.collator.get_sort_key(b.name)]
    end
  }
  scope :sort_by_duration_and_name_asc, lambda {
    sort do |a, b|
      [a.duration, Spell.collator.get_sort_key(a.name)] <=> [b.duration, Spell.collator.get_sort_key(b.name)]
    end
  }
  scope :sort_by_duration_and_name_desc, lambda {
    sort do |a, b|
      [b.duration, Spell.collator.get_sort_key(a.name)] <=> [a.duration, Spell.collator.get_sort_key(b.name)]
    end
  }

  CASTING = {
    '1 reakce' => 0, '1 bonusová akce' => 1, '1 akce' => 2, '1 akce, nebo 8 hodin' => 3,
    '1 minuta' => 4, '10 minut' => 5, '1 hodina' => 6, '8 hodin' => 7, '12 hodin' => 8,
    '24 hodin' => 9
  }.freeze

  RANGE = {
    'Ty sám' => 0, 'Ty sám (oblast)' => 1, 'Dotyk' => 2, '1 sáh' => 3, '2 sáhy' => 4,
    '3 sáhy' => 5, '6 sáhů' => 6, '6 sáhů (oblast)' => 7, '9 sáhů (oblast)' => 8,
    '10 sáhů' => 9, '12 sáhů' => 10, '15 sáhů' => 11, '16 sáhů' => 12, '18 sáhů' => 13,
    '20 sáhů' => 14, '24 sáhů' => 15, '30 sáhů' => 16, '60 sáhů' => 17, '100 sáhů' => 18,
    'Dohled' => 19, '1 míle' => 20, '800 mil' => 21, 'Neomezený' => 22, 'Zvláštní' => 23
  }.freeze

  DURATION = {
    'Ihned' => 0, 'Ihned, nebo 1 hodina' => 1, '1 kolo' => 2, '5 kol' => 3, '6 kol' => 4, '1 minuta' => 5,
    '10 minut' => 6, '1 hodina' => 7, '2 hodiny' => 8, '8 hodin' => 9, '24 hodin' => 10,
    '1 den' => 11, '7 dní' => 12, '10 dní' => 13, '30 dní' => 14, 'Do rozptýlení' => 15,
    'Do rozptýlení, nebo spuštění' => 16, 'Zvláštní' => 17
  }.freeze
end
