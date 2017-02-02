# searx-docker
Dockerization of searx, hosted on nginx

    sudo docker network create --subnet=172.18.0.0/16 searx-net
    sudo docker run --net searx-net --ip 172.18.0.22 -d --name searx wonderfall/searx:latest
    sudo docker build -t nginx-searx nginx/
    sudo docker run -d --net searx-net --name nginx-searx -p 443:443 -p 80:80 nginx-searx
    
## With nginx-proxy
    sudo docker run -d -p 80:80 --name nginx-proxy -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
    sudo docker run -e VIRTUAL_HOST=localhost --expose=8888 -d --name searx wonderfall/searx:latest

TODO:
- Make host_name and IP configurable
- Letsencrypt automatisation
- Docker Compose
- Automatic Deployment
    - Git hooks
    - Python fabric
