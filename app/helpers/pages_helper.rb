module PagesHelper
  def psql_array_czech_sort(array)
    collator.sort(array.flatten.uniq.compact)
  end

  def collator
    ::TwitterCldr::Collation::Collator.new(:cz)
  end

  def readable_contributors(contributors)
    return contributors.first if contributors.length == 1
    return contributors.join(' a ') if contributors.length == 2

    "#{contributors[0..-2].join(', ')} a #{contributors.last}"
  end
end
