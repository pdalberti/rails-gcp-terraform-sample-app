module PagesHelper
  def comma_unique(array)
    array.compact.map { |e| e.split(',') }.flatten.uniq.sort
  end
end
