# build
- `docker image build -t <id> .`
- `docker image build -t pwn .`

# run
- `docker container run -p <port>:<port running on container> -it <id> /bin/bash`
- `docker container run -p 8000:3000 -it pwn /bin/bash`