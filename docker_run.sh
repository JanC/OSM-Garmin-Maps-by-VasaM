#! /bin/bash

# Usage:
# ./docker_run.sh CZ 

area=$1
workdir=${2:-"output"}
encoding=${3:-"unicode"}

mkdir -p ${workdir}/{maps,polygons,userAreas,pbf,hgt}

docker run --rm -it \
	-v ${workdir}/maps:/vasam/maps/ \
	-v ${workdir}/polygons:/vasam/polygons/ \
    -v ${workdir}/userAreas:/vasam/userAreas/ \
	-v ${workdir}/pbf:/vasam/pbf/ \
	-v ${workdir}/hgt:/vasam/hgt/ \
	-e area=${area} \
	-e encoding=${encoding} \
	textwil/vasam_garmin  # /bin/bash
