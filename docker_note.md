(need to add `sudo` before all command if you meet `permission denied`)
# build
- `docker image build -t <id> .`
- `docker image build -t pwn .`

# create temporary container
- `docker run -it --rm -v $(pwd):/chal --platform linux/amd64 <image-version>`
- libc:
    - `cp /lib/x86_64-linux-gnu/libc.so.6 /chal`
    - `docker run -it --rm -v $(pwd):/chal --platform linux/amd64 <image-version> cp /lib/x86_64-linux-gnu/libc.so.6 /chal`
  ### install gcc and make
  - `apt-get update && apt-get install -y gcc make`

# run
- `docker container run --rm -p 3000:3000 -it pwn`
  ### with shell
  - `docker container run --rm -p 3000:3000 -it pwn /bin/bash`

# copy
  ### local to container
  - `docker container cp <file path of local> <id>:<path in container>` 
  - `docker cp ./file 4bb416536c04:/app`
  ### container to local
  - `docker container cp <id>:<file path in container> <path of local>` 
  - `docker cp 4bb416536c04:/app/chall ./`

# kill container
- `exit` in container shell
- `docker container kill <hash-id>`

# remove all
  1. Containers
  - `docker stop $(docker ps -a -q)`
  - `docker rm $(docker ps -a -q)`

  2. Images
  - `docker rmi $(docker images -a -q)`

# remove volume with container
- `docker rm -v container_name`
- `docker rm -v pwn`
  
# image source
- `https://docker.1panel.live`
