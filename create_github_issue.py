import requests
import json

def create_github_issue(token, repo, title, body, labels):
    url = f'https://api.github.com/repos/{repo}/issues'
    headers = {
        'Authorization': f'token {token}',
        'Accept': 'application/vnd.github.v3+json'
    }
    data = {
        'title': title,
        'body': body,
        'labels': labels  # ラベルのリスト
    }
    response = requests.post(url, headers=headers, data=json.dumps(data))
    return response.json()

# 以下の情報を設定してください
token = 'YOUR_GITHUB_TOKEN'  # GitHubのパーソナルアクセストークン
repo = 'your_username/your_repo'  # 'ユーザー名/レポジトリ名'の形式
title = 'Your Issue Title'  # イシューのタイトル
body = 'Description of the issue'  # イシューの説明
labels = ['bug', 'help wanted']  # 付けたいラベルのリスト

response = create_github_issue(token, repo, title, body, labels)
print(response)
