* change env file to .env before use

* for production environment
```
docker-compose --log-level info up
```

* recommend to use provided script in bash/tool_docker_compose.sh

* Both $VARIABLE and ${VARIABLE} syntax are supported

* .env file feature only works with docker-compose up(not with swarm stack deploy)

* re-use configuration fragments using extension fields(v2.1~)
```
x-logging:
  &default-logging
  ...
services:
  web:
    logging: *default-logging
```

* partially override values in extension fields using the YAML merge type
```
x-volumes:
  &default-volume
  ...
volumes:
  vol1: *default-volume
  vol2:
    << : *default-volume
    name: volume02
```

* when deploying whole container as server node, perform below
```
rm -rf /root/.vscode-server
```

