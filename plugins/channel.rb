class Channel
  include Cinch::Plugin

  listen_to :channel,    method: :log_public_message

  def log_public_message(m)
    channel = m.channel.to_s[1..m.channel.to_s.length]
    filename = "data/logs/#{channel}.yaml"
    unless File.exist?(filename)
      File.new(filename, 'w+')
      exconfig = YAML.load_file('data/logs/logs.example.yaml')
      File.open(filename, 'w') { |f| f.write exconfig.to_yaml }
    end
    data = YAML.load_file(filename)
    count = data['count']
    data[count + 1] = "#{m.user}: #{m.message}"
    data['count'] += 1
    File.open(filename, 'w') { |f| f.write data.to_yaml }
  end
end
