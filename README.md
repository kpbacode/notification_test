# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

```shell
rails db:setup
rails db:migrate
```

```markdown
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
curl -X POST -H "Content-Type: application/json" -d '{
  "seen": true
}' http://localhost:3000/notification_clients/1
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
  "notification_id": 1,
  "client_id": 1
}' http://localhost:3000/notification_clients
```

### List clients
```shell
curl -X GET -H "Content-Type: application/json" \
http://localhost:3000/clients
```
```

