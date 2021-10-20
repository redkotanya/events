#!/bin/bash

set -e


pause() {
  local step="${1}"
  ps1
  echo -n "####: ${step}"
  read
}

ps1() {
  echo -ne "\033[01;32m${USER}@$(hostname -s) \033[01;34m$(basename $(pwd)) \$ \033[00m"
}

echocmd() {
  echo "$(ps1)$@"
}

docmd() {
  echocmd $@
  $@
}


step0() {
    pause "check the list of images"
    docmd docker images

    pause "pull the necessary image"
    docmd docker pull hello-world

    pause "run the image hello-world"
    docmd  docker run hello-world

    pause "check the list of images ... again"
    docmd docker images
}

step1() {
  
  
  docmd docker run -it --rm pdevine/whale-test
 
}

step2() {
  
  pause "Let's add some fun. Launching a more useful image."
  docmd docker run -it --rm pdevine/tetromino
 
}

step3() {
  
  
  cd t2

  pause "build image"
  docmd docker build -t some-content-nginx .

  pause "Launching our Nginx image    "

  docmd docker run --name some-nginx-1 -d -p 8080:80 some-content-nginx

  cd -
 
}


pause "demo #1"
step0 

pause "demo #2"
step2 

pause "demo #3"
step3