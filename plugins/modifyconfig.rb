class ModifyConfig
  include Cinch::Plugin

  match /changeownerhost (.+) (.+)/, method: :changeit
  match /configure (.+) (.+)/, method: :config

  def changeit(m, pass, hostto)
    if pass == CONFIG['modifypass']
      d = YAML.load_file('config.yaml')
      d['ownerhost'] = hostto.to_s
      File.open('config.yaml', 'w') { |f| f.write d.to_yaml }
      m.reply 'Modified Hostname successfully!'
    else
      m.reply 'Incorrect Password!'
    end
  end

  def config(m, pass, option)
    if pass == CONFIG['modifypass']
      if option == 'ownerhost'
        d = YAML.load_file('config.yaml')
        d['ownerhost'] = m.user.host.to_s
        File.open('config.yaml', 'w') { |f| f.write d.to_yaml }
        m.reply 'Your Ownerhost has been set to your current host!'
      end
    else
      m.reply 'Incorrect Password!'
    end
  end
end
