require 'slack-ruby-client'

def fetch_slack_message_and_thread(token, channel_id, message_ts)
  # Slackクライアントの設定
  Slack.configure do |config|
    config.token = token
  end

  client = Slack::Web::Client.new

  begin
    # スレッドのメッセージを取得
    response = client.conversations_replies(channel: channel_id, ts: message_ts)
    messages = response.messages
    return messages
  rescue Slack::Web::Api::Errors::SlackError => e
    puts "Error fetching message and thread: #{e.message}"
    return []
  end
end

# 使用例
# APIトークン、チャンネルID、メッセージのタイムスタンプを適宜変更してください。
token = "YOUR_SLACK_API_TOKEN"
channel_id = "YOUR_CHANNEL_ID"
message_ts = "YOUR_MESSAGE_TS"

messages = fetch_slack_message_and_thread(token, channel_id, message_ts)
messages.each do |message|
  puts message
end
