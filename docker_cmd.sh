#! /bin/bash

area=$1
encoding=$2
python3 prepareUserAreas.py
python3 gmapmaker.py -a ${area} -c ${encoding} --download auto