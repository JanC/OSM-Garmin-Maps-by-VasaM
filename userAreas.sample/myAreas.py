from makerfuncs.Area import Area
from makerfuncs.states import STATES

USER_AREAS = {
	'OL': Area(
		parent = 'CZ',
		nameCs = 'Olomouc',
		number = 8800,
		pois   = ['./pois/chs.osm.xml',],
		crop   = True
	),

	'CeskyRaj': Area(
		parent = 'CZ',
		nameCs = 'CeskyRaj',
		number = 8801,
		pois   = [],
		crop   = True
	),

	'Praha': Area(
		parent = 'CZ',
		nameCs = 'Praha',
		number = 8802,
		pois   = [],
		crop   = True
	),
}
