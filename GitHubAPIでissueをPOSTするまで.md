# GitHubAPIでissueをPOSTするまで

### **GitHubパーソナルアクセストークンの取得手順**

1. **GitHubにログイン**:

まず、[GitHub](https://github.com/)にログインします。
2. **設定にアクセス**:

右上隅にあるプロフィール画像をクリックし、ドロップダウンメニューから「Settings」（設定）を選択します。
        
3. **Developer settingsに移動**:

設定ページの左側のサイドバーで、「Developer settings」（開発者設定）をクリックします。
        
4. **Personal access tokensにアクセス**:

「Developer settings」ページのサイドバーから「Personal access tokens」（パーソナルアクセストークン）を選択します。
        
5. **新しいトークンを生成**:

「Generate new token」（新しいトークンを生成）ボタンをクリックします。
        
6. **有効期限の設定**:

「Expiration」（有効期限）セクションで、トークンの有効期限を設定します。例えば、「30 days」（30日間）、「60 days」（60日間）、「90 days」（90日間）、「No expiration」（無期限）から選択できます。

7. **トークンの設定**:

トークンの名前を入力し（例: **`MyAPIToken`**）、必要なスコープ（アクセス許可）を選択します。例えば、リポジトリに関連する操作を行いたい場合は、「repo」スコープを選択します。GitHubのAPIを使用する目的に応じて適切なスコープを選択してください。
    - **`repo`**: プライベートリポジトリを含む、あなたのリポジトリに対する広範なアクセス権を提供します。このスコープはリポジトリ内でのイシューの作成、閲覧、更新、削除を可能にします。
        
8. **トークンの生成**:

ページの下部にある「Generate token」（トークンを生成）ボタンをクリックします。

9. **トークンのコピーと保存**:

生成されたトークンが表示されます。このトークンは後で見ることができないので、必ず安全な場所にコピーして保存してください。
        

### GitHubのAPIを使ってissueをポストするPythonコード

このコードでは、**`requests`** ライブラリを使用してGitHub APIにアクセスします。もし **`requests`** ライブラリがインストールされていない場合は、**`pip install requests`** を実行してインストールしてください。

```python
import requests
import json

def create_github_issue(token, repo, title, body):
    url = f'https://api.github.com/repos/{repo}/issues'
    headers = {
        'Authorization': f'token {token}',
        'Accept': 'application/vnd.github.v3+json'
    }
    data = {
        'title': title,
        'body': body
    }
    response = requests.post(url, headers=headers, data=json.dumps(data))
    return response.json()

# 以下の情報を設定してください
token = 'YOUR_GITHUB_TOKEN'  # GitHubのパーソナルアクセストークン
repo = 'your_username/your_repo'  # 'ユーザー名/レポジトリ名'の形式
title = 'Your Issue Title'  # イシューのタイトル
body = 'Description of the issue'  # イシューの説明

response = create_github_issue(token, repo, title, body)
print(response)
```

- レスポンス
    
    > print(response)
    {'url': 'https://api.github.com/repos/Naoya-Wizard/SlackStampToIssue/issues/1', 'repository_url': 'https://api.github.com/repos/Naoya-Wizard/SlackStampToIssue', 'labels_url': 'https://api.github.com/repos/Naoya-Wizard/SlackStampToIssue/issues/1/labels{/name}', 'comments_url': 'https://api.github.com/repos/Naoya-Wizard/SlackStampToIssue/issues/1/comments', 'events_url': 'https://api.github.com/repos/Naoya-Wizard/SlackStampToIssue/issues/1/events', 'html_url': 'https://github.com/Naoya-Wizard/SlackStampToIssue/issues/1', 'id': 2021860809, 'node_id': 'I_kwDOK0qE5854gyXJ', 'number': 1, 'title': 'Your Issue Title', 'user': {'login': 'Naoya-Wizard', 'id': 79356057, 'node_id': 'MDQ6VXNlcjc5MzU2MDU3', 'avatar_url': 'https://avatars.githubusercontent.com/u/79356057?v=4', 'gravatar_id': '', 'url': 'https://api.github.com/users/Naoya-Wizard', 'html_url': 'https://github.com/Naoya-Wizard', 'followers_url': 'https://api.github.com/users/Naoya-Wizard/followers', 'following_url': 'https://api.github.com/users/Naoya-Wizard/following{/other_user}', 'gists_url': 'https://api.github.com/users/Naoya-Wizard/gists{/gist_id}', 'starred_url': 'https://api.github.com/users/Naoya-Wizard/starred{/owner}{/repo}', 'subscriptions_url': 'https://api.github.com/users/Naoya-Wizard/subscriptions', 'organizations_url': 'https://api.github.com/users/Naoya-Wizard/orgs', 'repos_url': 'https://api.github.com/users/Naoya-Wizard/repos', 'events_url': 'https://api.github.com/users/Naoya-Wizard/events{/privacy}', 'received_events_url': 'https://api.github.com/users/Naoya-Wizard/received_events', 'type': 'User', 'site_admin': False}, 'labels': [], 'state': 'open', 'locked': False, 'assignee': None, 'assignees': [], 'milestone': None, 'comments': 0, 'created_at': '2023-12-02T05:06:51Z', 'updated_at': '2023-12-02T05:06:51Z', 'closed_at': None, 'author_association': 'OWNER', 'active_lock_reason': None, 'body': 'Description of the issue', 'closed_by': None, 'reactions': {'url': 'https://api.github.com/repos/Naoya-Wizard/SlackStampToIssue/issues/1/reactions', 'total_count': 0, '+1': 0, '-1': 0, 'laugh': 0, 'hooray': 0, 'confused': 0, 'heart': 0, 'rocket': 0, 'eyes': 0}, 'timeline_url': 'https://api.github.com/repos/Naoya-Wizard/SlackStampToIssue/issues/1/timeline', 'performed_via_github_app': None, 'state_reason': None}
    > 
- ラベルをつけたい時はこちら
    
    ```python
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
    ```
    


### おまけ：issueにコメントするコード

```python
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
```

- レスポンス
    
    > print(response)
    {'url': 'https://api.github.com/repos/Naoya-Wizard/SlackStampToIssue/issues/comments/1837048816', 'html_url': 'https://github.com/Naoya-Wizard/SlackStampToIssue/issues/1#issuecomment-1837048816', 'issue_url': 'https://api.github.com/repos/Naoya-Wizard/SlackStampToIssue/issues/1', 'id': 1837048816, 'node_id': 'IC_kwDOK0qE585tfyPw', 'user': {'login': 'Naoya-Wizard', 'id': 79356057, 'node_id': 'MDQ6VXNlcjc5MzU2MDU3', 'avatar_url': 'https://avatars.githubusercontent.com/u/79356057?u=f583cb819588c59061dd9c7e71c0d611b10cd8c2&v=4', 'gravatar_id': '', 'url': 'https://api.github.com/users/Naoya-Wizard', 'html_url': 'https://github.com/Naoya-Wizard', 'followers_url': 'https://api.github.com/users/Naoya-Wizard/followers', 'following_url': 'https://api.github.com/users/Naoya-Wizard/following{/other_user}', 'gists_url': 'https://api.github.com/users/Naoya-Wizard/gists{/gist_id}', 'starred_url': 'https://api.github.com/users/Naoya-Wizard/starred{/owner}{/repo}', 'subscriptions_url': 'https://api.github.com/users/Naoya-Wizard/subscriptions', 'organizations_url': 'https://api.github.com/users/Naoya-Wizard/orgs', 'repos_url': 'https://api.github.com/users/Naoya-Wizard/repos', 'events_url': 'https://api.github.com/users/Naoya-Wizard/events{/privacy}', 'received_events_url': 'https://api.github.com/users/Naoya-Wizard/received_events', 'type': 'User', 'site_admin': False}, 'created_at': '2023-12-02T05:32:19Z', 'updated_at': '2023-12-02T05:32:19Z', 'author_association': 'OWNER', 'body': 'This is a comment posted to an issue.', 'reactions': {'url': 'https://api.github.com/repos/Naoya-Wizard/SlackStampToIssue/issues/comments/1837048816/reactions', 'total_count': 0, '+1': 0, '-1': 0, 'laugh': 0, 'hooray': 0, 'confused': 0, 'heart': 0, 'rocket': 0, 'eyes': 0}, 'performed_via_github_app': None}
    > 

