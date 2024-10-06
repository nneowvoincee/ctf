(need to add `sudo` before all command if you meet `permission denied`)
# build
- `docker image build -t <id> .`
- `docker image build -t pwn .`

# create temporary container
- `docker run -it --rm -v $(pwd):/chal --platform linux/amd64 <image-version>`

# run
- `docker container run -p <port>:<port running on container> -it <id> /bin/bash`
- `docker container run -p 3000:3000 -it pwn /bin/bash`

# run (remove automatically after exit)
- `docker container run --rm -p 3000:3000 -it pwn /bin/bash`

# copy
- local to container
  - `docker container cp <file path of local> <id>:<path in container>` 
  - `docker cp ./file 4bb416536c04:/app`
- container to local
  - `docker container cp <id>:<file path in container> <path of local>` 
  - `docker cp 4bb416536c04:/app/chall ./`

# remove all
- Containers
- `docker stop $(docker ps -a -q)`
- `docker rm $(docker ps -a -q)`

- Images
- `docker rmi $(docker images -a -q)`

# remove volume with container
- `docker rm -v container_name`
- `docker rm -v pwn`
