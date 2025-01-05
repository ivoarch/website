#!/bin/bash

# build website
make build
# build gallery
llgal --config /home/ivo/website/public/images/.llgal/my_llgalrc \
      -d /home/ivo/website/public/images
# sync to /var/www
sudo rsync -rv build/ /var/www/ivaylokuzev.eu
