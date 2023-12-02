require 'net/http'
require 'json'
require 'uri'

def create_github_issue(token, repo, title, body, labels)
  url = URI("https://api.github.com/repos/#{repo}/issues")
  headers = {
    'Authorization' => "token #{token}",
    'Accept' => 'application/vnd.github.v3+json'
  }
  data = {
    'title' => title,
    'body' => body,
    'labels' => labels  # ラベルのリスト
  }.to_json

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
title = 'Your Issue Title'  # イシューのタイトル
body = 'Description of the issue'  # イシューの説明
labels = ['bug', 'help wanted']  # 付けたいラベルのリスト

response = create_github_issue(token, repo, title, body, labels)
puts response
