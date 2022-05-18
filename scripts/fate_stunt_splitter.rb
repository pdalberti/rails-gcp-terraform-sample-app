paths = Dir['storage/fate/*.md'].sort

File.open('storage/fate-stunts.md', 'w') do |f|
  paths.each do |path|
    file = File.read(path)
    file.split('</stunt>').each do |stunt|
      content = "#{stunt.strip}\n</stunt>\n\n"
      f.write(content)
    end
  end
end
