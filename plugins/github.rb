class GitHub
  include Cinch::Plugin

  match /ghissue (.+) (.+)/, method: :ghissue
  match /ghpull (.+) (.+)/, method: :ghissue

  def ghissue(m, repo, issuenum)
    issuenum = issuenum.to_i
    if issuenum < 1
      m.reply 'Invalid Issue count!'
      return
    end
    issueurl = "https://api.github.com/repos/#{repo}/issues/#{issuenum}"
    begin
      parsed = JSON.parse(RestClient.get(issueurl))
    rescue
      m.reply 'Invalid Repo or Issue number!'
      return
    end
    issueorpull = parsed['html_url'].split('/')[5]
    issueorpull = 'Issue' if issueorpull == 'issues'
    issueorpull = 'Pull' if issueorpull == 'pull'
    status = parsed['state']
    if status == 'closed'
      statusformatted = Format(:bold, Format(:red, 'Closed'))
      statusformatted += " by #{parsed['closed_by']['login']}"
    end
    statusformatted = Format(:bold, Format(:green, 'Open')) if status == 'open'
    m.reply "#{issueorpull} ##{issuenum} (#{statusformatted}): #{parsed['html_url']} | #{parsed['title']}"
  end
end
