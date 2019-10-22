

## サービスとして登録する

`/etc/systemd/system/go-simple-server.service` を以下の内容で作成。

```
[Unit]
Description = go simple server

[Service]
ExecStart = /app/server
Restart = always
Type = simple

[Install]
WantedBy = multi-user.target
```

以下のコマンドで登録されているかチェックし、起動させる。

```
sudo systemctl list-unit-files --type=service | grep go-simple-service

sudo systemctl enable go-simple-server

sudo systemctl start go-simple-server
```


