
# 고정 ip 할당을 위해 --ip 설정
docker network create --subnet 10.0.0.0/24 my-net

sudo docker run -itd --network my-net --name master --ip 10.0.0.2 -p 28088:8088 ubuntu-spark:latest /bin/bash

sudo docker run -itd --network my-net --name slave-1 --ip 10.0.0.3 -p 28089:8088 ubuntu-spark:latest /bin/bash

sudo docker run -itd --network my-net --name slave-2 --ip 10.0.0.4 -p 28090:8088 ubuntu-spark:latest /bin/bash
