class GitHub
  include Cinch::Plugin

  match /ghissue (.+) (.+)/, method: :ghissue

  def ghissue(m, repo, issuenum)
    issuenum = issuenum.to_i
    issueurl = "https://api.github.com/repos/#{repo}/issues/#{issuenum}"
    parsed = JSON.parse(RestClient.get(issueurl))
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
