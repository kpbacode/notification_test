# README

This README would normally document whatever steps are necessary to get the
application up and running.

```config
Postgres

user: postgres
password: (empty)
```


```shell
rails db:setup
rails db:migrate
```


### Create a notification
```shell
curl -X POST -H "Content-Type: application/json" -d '{
  "notification": {
    "date": "2023-07-01",
    "title": "Important Update",
    "description": "Please read the updated TOS"
  }
}' http://localhost:3000/notifications
```

### Mark a notification as seen
```shell
curl -X PUT -H "Content-Type: application/json" -d '{
  "seen": true
}' http://localhost:3000/notification_clients/1
```

```sql
 id | notification_id | client_id | seen |         created_at         |         updated_at
----+-----------------+-----------+------+----------------------------+----------------------------
  8 |               1 |         1 | f    | 2023-07-07 13:44:27.44707  | 2023-07-07 13:44:27.44707
  9 |               1 |         1 | f    | 2023-07-07 14:28:09.236219 | 2023-07-07 14:28:09.236219
  7 |               2 |         1 | t    | 2023-07-07 13:44:11.772385 | 2023-07-07 14:29:40.345231
```

### Assign a notification to a client
```shell
curl -X POST -H "Content-Type: application/json" -d '{
  "notification_id": 1,
  "client_id": 1
}' http://localhost:3000/notification_clients
```

### Create a client
```shell
curl -X POST -H "Content-Type: application/json" -d '{
  "client": {
    "name": "John Doe"
  }
}' http://localhost:3000/clients
```

### Assign multiple IDs to a client
```shell
curl -X POST -H "Content-Type: application/json" -d '{
  "notification_id": 1,
  "client_id": 1
}' http://localhost:3000/notification_clients
```

```shell
curl -X POST -H "Content-Type: application/json" -d '{
  "notification_id": 2,
  "client_id": 1
}' http://localhost:3000/notification_clients
```

```
 id | notification_id | client_id | seen |         created_at         |         updated_at
----+-----------------+-----------+------+----------------------------+----------------------------
  7 |               2 |         1 | f    | 2023-07-07 13:44:11.772385 | 2023-07-07 13:44:11.772385
  8 |               1 |         1 | f    | 2023-07-07 13:44:27.44707  | 2023-07-07 13:44:27.44707
  ```

### List clients
```shell
curl -X GET -H "Content-Type: application/json" \
http://localhost:3000/clients
```

### List Notifications
```shell
curl -X GET -H "Content-Type: application/json"  http://localhost:3000/notifications
```