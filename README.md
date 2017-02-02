# searx-docker
Dockerization of searx, hosted on nginx
    
## With nginx-proxy
    sudo docker run -d -p 80:80 --name nginx-proxy -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
    sudo docker run -e VIRTUAL_HOST=localhost --expose=8888 -d --name searx wonderfall/searx:latest

TODO:
- Letsencrypt automatisation
- Docker Compose
- Automatic Deployment
    - Push to remote branch
    - Git hooks: merge with master on push
    - Python fabric?
