require 'yaml'

# history > /tmp/histo.txt

cmds = []
File.open("/tmp/histo.txt").each { |line|
    m = line.match /\s*\d*\s*(.*)/
    if m.nil?
      puts "there is a problem with #{line}"
      exit
    end

    cmds << m[1]
}

# puts cmds

stats = {}
cmds.each do |cmd|
  # puts cmd

  if stats[cmd.strip].nil?
    stats[cmd.strip] = 1
  else
    stats[cmd.strip] += 1
  end

end

res = stats.sort{|a,b| b[1]<=>a[1]}

res.each do |line|
  if line[1] > 20
  puts "#{line[1]} : #{line[0]}"
  end
end

 # puts YAML::dump stats.sort


