## GET /score_reports
Score_reportsの配列が返ってくる.

### Example

#### Request
```
GET /score_reports HTTP/1.1

```

#### Response
```
HTTP/1.1 200
Content-Type: application/json; charset=utf-8

{
  "score_reports": [
    {
      "id": 120,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0",
      "game_date": "2016-09-23"
    },
    {
      "id": 119,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0",
      "game_date": "2016-09-23"
    },
    {
      "id": 118,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0",
      "game_date": "2016-09-23"
    },
    {
      "id": 117,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0",
      "game_date": "2016-09-23"
    },
    {
      "id": 116,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0",
      "game_date": "2016-09-23"
    },
    {
      "id": 115,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0",
      "game_date": "2016-09-23"
    },
    {
      "id": 114,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0",
      "game_date": "2016-09-23"
    },
    {
      "id": 113,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0",
      "game_date": "2016-09-23"
    },
    {
      "id": 112,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0",
      "game_date": "2016-09-23"
    },
    {
      "id": 111,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0",
      "game_date": "2016-09-23"
    }
  ]
}
```

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
      "id": 122,
      "inning": "1回表",
      "name": "田中",
      "detail": "3塁線をやぶるタイムリーヒット",
      "score": "2-0"
    }
  ],
  "result": "勝ったよ〜"
}
```
