# GitHubAPIでissueをPOSTするまで

### **GitHubパーソナルアクセストークンの取得手順**

1. **GitHubにログイン**:
まず、[GitHub](https://github.com/)にログインします。
2. **設定にアクセス**:
右上隅にあるプロフィール画像をクリックし、ドロップダウンメニューから「Settings」（設定）を選択します。
    - 画像
        
        ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8f033544-0b5d-4ab1-b844-c4d2ed6ddcfe/b9034b23-3123-467b-a067-b9078d427fe5/Untitled.png)
        
3. **Developer settingsに移動**:
設定ページの左側のサイドバーで、「Developer settings」（開発者設定）をクリックします。
    - 画像
        
        ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8f033544-0b5d-4ab1-b844-c4d2ed6ddcfe/8d32def7-86e6-4441-8d41-308ea302219d/Untitled.png)
        
4. **Personal access tokensにアクセス**:
「Developer settings」ページのサイドバーから「Personal access tokens」（パーソナルアクセストークン）を選択します。
    - 画像
        
        ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8f033544-0b5d-4ab1-b844-c4d2ed6ddcfe/f9c0f314-0313-47bf-879f-ce950d7d67be/Untitled.png)
        
5. **新しいトークンを生成**:
「Generate new token」（新しいトークンを生成）ボタンをクリックします。
    - 画像
        
        ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8f033544-0b5d-4ab1-b844-c4d2ed6ddcfe/1cf50bef-d96a-4b46-bf22-901e16edf3a0/Untitled.png)
        
6. **有効期限の設定**:
「Expiration」（有効期限）セクションで、トークンの有効期限を設定します。例えば、「30 days」（30日間）、「60 days」（60日間）、「90 days」（90日間）、「No expiration」（無期限）から選択できます。
7. **トークンの設定**:
トークンの名前を入力し（例: **`MyAPIToken`**）、必要なスコープ（アクセス許可）を選択します。例えば、リポジトリに関連する操作を行いたい場合は、「repo」スコープを選択します。GitHubのAPIを使用する目的に応じて適切なスコープを選択してください。
    - **`repo`**: プライベートリポジトリを含む、あなたのリポジトリに対する広範なアクセス権を提供します。このスコープはリポジトリ内でのイシューの作成、閲覧、更新、削除を可能にします。
    - 画像
        
        ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8f033544-0b5d-4ab1-b844-c4d2ed6ddcfe/46c47c43-1e02-4b5a-b05b-660e1c289c7e/Untitled.png)
        
8. **トークンの生成**:
ページの下部にある「Generate token」（トークンを生成）ボタンをクリックします。
9. **トークンのコピーと保存**:
生成されたトークンが表示されます。このトークンは後で見ることができないので、必ず安全な場所にコピーして保存してください。
    - 画像