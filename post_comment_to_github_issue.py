import requests
import json

def post_comment_to_github_issue(token, repo, issue_number, comment):
    url = f'https://api.github.com/repos/{repo}/issues/{issue_number}/comments'
    headers = {
        'Authorization': f'token {token}',
        'Accept': 'application/vnd.github.v3+json'
    }
    data = {
        'body': comment
    }
    response = requests.post(url, headers=headers, data=json.dumps(data))
    return response.json()

# 以下の情報を設定してください
token = 'YOUR_GITHUB_TOKEN'  # GitHubのパーソナルアクセストークン
repo = 'your_username/your_repo'  # 'ユーザー名/レポジトリ名'の形式
issue_number = 1  # コメントを追加するイシューの番号
comment = 'This is a comment posted to an issue.'  # 追加するコメント

response = post_comment_to_github_issue(token, repo, issue_number, comment)
print(response)
