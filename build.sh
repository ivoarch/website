#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as sudo / root"
  exit
fi

# update blog
make build
# update gallery
llgal --config /home/ivo/website/public/images/.llgal/my_llgalrc \
      -d /home/ivo/website/public/images
# sync to /var/www
rsync -rv build/ /var/www/ivaylokuzev.eu
