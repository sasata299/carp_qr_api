## GET /score_reports
Score_reportsに加えてresultも返ってくる.

### Example

#### Request
```
GET /score_reports HTTP/1.1

```

#### Response
```
HTTP/1.1 200
Content-Type: text/html; charset=utf-8

{"game_date":"2016-09-18","score_reports":[{"id":16,"inning":"1回表","name":"田中","detail":"3塁線をやぶるタイムリーヒット","score":"2-0"}],"result":"勝ったよ〜"}
```
