require 'net/http'
require 'json'
require 'uri'

def post_comment_to_github_issue(token, repo, issue_number, comment)
  url = URI("https://api.github.com/repos/#{repo}/issues/#{issue_number}/comments")
  headers = {
    'Authorization' => "token #{token}",
    'Accept' => 'application/vnd.github.v3+json'
  }
  data = { 'body' => comment }.to_json

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Post.new(url, headers)
  request.body = data

  response = http.request(request)
  JSON.parse(response.body)
end

# 以下の情報を設定してください
token = 'YOUR_GITHUB_TOKEN'  # GitHubのパーソナルアクセストークン
repo = 'your_username/your_repo'  # 'ユーザー名/レポジトリ名'の形式
issue_number = 1  # コメントを追加するイシューの番号
comment = 'This is a comment posted to an issue.'  # 追加するコメント

response = post_comment_to_github_issue(token, repo, issue_number, comment)
puts response
