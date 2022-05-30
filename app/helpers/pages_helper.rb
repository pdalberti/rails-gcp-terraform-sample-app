module PagesHelper
  def psql_array_czech_sort(array)
    collator.sort(array.flatten.uniq)
  end

  def collator
    ::TwitterCldr::Collation::Collator.new(:cz)
  end
end
