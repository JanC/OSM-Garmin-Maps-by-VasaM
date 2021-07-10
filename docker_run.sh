#! /bin/bash

mkdir -p /tmp/vasam/{maps,polygons,userAreas,pbf}

area=$1

docker run --rm -it \
	-v /tmp/vasam/maps:/vasam/maps/ \
	-v /tmp/vasam/polygons:/vasam/polygons/ \
    -v /tmp/vasam/userAreas:/vasam/userAreas/ \
	-v /tmp/vasam/pbf:/vasam/pbf/ \
	-e area=${area} textwil/vasam


# debug 
# docker run --rm -it \
# 	-v /tmp/vasam/maps:/vasam/maps/ \
# 	-v /tmp/vasam/polygons:/vasam/polygons/ \
#     -v /tmp/vasam/userAreas:/vasam/userAreas/ \
# 	-v /tmp/vasam/pbf:/vasam/pbf/ \
# 	-e area=${area} textwil/vasam /bin/bash

