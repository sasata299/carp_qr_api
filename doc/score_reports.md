## GET /score_reports/2016-09-23
Score_reportsに加えてresultも返ってくる.

### Example

#### Request
```
GET /score_reports/2016-09-23 HTTP/1.1

```

#### Response
```
HTTP/1.1 200
Content-Type: application/json; charset=utf-8

{
  "game_date": "2016-09-23",
  "score_reports": [
    {
      "id": 40,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0"
    }
  ],
  "result": "勝ったよ〜"
}
```
