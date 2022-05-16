paths = Dir['storage/fate/*.md'].sort

File.open('storage/fate-tricks.md', 'w') do |f|
  paths.each do |path|
    file = File.read(path)
    file.split('</stunt>').each do |trick|
      content = "#{trick.strip}\n</stunt>\n\n"
      f.write(content)
    end
  end
end
