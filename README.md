# DevSetup
This repo contains scripts, dockerfiles etc to set up my preferred environment quickly

## Docker setup
* Create a new docker image
```sh
docker build -t <image-name> [-f dockerfileName] .
```
* Run dockerfile with mappings
```sh
nvidia-docker run --rm --name <container-name> -it -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix -v /root/.Xauthority:/root/.Xauthority:rw -v /home/ankdesh/explore:/home/ankdesh/explore  -v /home/ankdesh/virtualenvs:/home/ankdesh/virtualenvs -v /home/ankdesh/.ssh:/home/ankdesh/.ssh -p 8888:8888  <image_name>:latest
```
