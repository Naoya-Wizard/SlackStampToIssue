# TestSlackStampToIssue

```
curl -X POST https://tranquil-garden-92891-c39d6a90f699.herokuapp.com/slack/events -H "Content-Type: application/json" -d "{\"type\": \"event_callback\", \"event\": {\"type\": \"reaction_added\"}}"
```
```
curl -X POST http://localhost:4567/slack/events \-H "Content-Type: application/json" \-d "{\"type\": \"event_callback\", \"event\": {\"type\": \"reaction_added\"}}"
```
