#! /bin/bash

mkdir -p ${PWD}/{maps,polygons,userAreas,pbf}

area=$1

docker run --rm -it \
	-v ${PWD}/maps:/vasam/maps/ \
	-v ${PWD}/polygons:/vasam/polygons/ \
    -v ${PWD}/userAreas:/vasam/userAreas/ \
	-v ${PWD}/pbf:/vasam/pbf/ \
	-e area=${area} textwil/vasam


# debug 
# docker run --rm -it \
# 	-v /tmp/vasam/maps:/vasam/maps/ \
# 	-v /tmp/vasam/polygons:/vasam/polygons/ \
#     -v /tmp/vasam/userAreas:/vasam/userAreas/ \
# 	-v /tmp/vasam/pbf:/vasam/pbf/ \
# 	-e area=${area} textwil/vasam /bin/bash

