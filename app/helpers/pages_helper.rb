module PagesHelper
  def comma_unique(array)
    array.compact.map { |e| e.split(',').map(&:strip) }.flatten.uniq.compact_blank.sort
  end
end
