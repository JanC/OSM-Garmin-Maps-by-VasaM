#! /bin/bash

python3 -c 'import prepare; prepare.prepareUserAreas()'

python3 gmapmaker.py -a ${area} -c ${encoding} --download auto