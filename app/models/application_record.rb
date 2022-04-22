class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.collator
    @collator ||= TwitterCldr::Collation::Collator.new(:cz)
  end
end
