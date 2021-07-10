import zipfile, os
from prepareUserAreas import prepareUserAreas
from makerfuncs import download as d, config
import update as u

def prepare():

	default = {
		'img':      'maps',
		'pbf':      'pbf',
		'polygons': 'polygons',
		'hgt':      'hgt',
		'temp':     'temp',
		'sea':      'sea',
		'bounds':   'bounds',
	}

	data = {
		'img':      '',
		'pbf':      '',
		'polygons': '',
		'hgt':      '',
		'temp':     '',
		'sea':      '',
		'bounds':   '',
	}


	#TODO kontroly validity vstupu
	# data['img'] = input('The name of the output folder with garmin maps (default maps): ')
	# data['pbf'] = input('The name of the folder for map data download (default pbf): ')
	# data['polygons'] = input('The name of the folder for polygons (default polygons): ')
	# data['hgt'] = input('The name of the folder for height data (default hgt): ')
	# data['temp'] = input('The name of the folder for temporary data (default temp): ')
	# data['sea'] = input('The name of the folder for sea data (default sea): ')
	# data['bounds'] = input('The name of the folder for bounds data (default bounds): ')

	for item in data:
		if data[item] == '':
			data[item] = default[item]
		if data[item][-1] != '/':
			data[item] = data[item] + '/'
		
		try:
			os.mkdir(data[item])
		except:
			pass

	# TODO phyghtmap

	config.save(data)

	prepareUserAreas()

	if not os.path.exists(data['sea']):
		d.download('http://osm.thkukuk.de/data/sea-latest.zip', './sea.zip')
		with zipfile.ZipFile('./sea.zip', 'r') as zipRef:
			zipRef.extractall(data['sea'])
		#os.remove('./sea.zip')

	if not os.path.exists(data['bounds']):
		d.download('http://osm.thkukuk.de/data/bounds-latest.zip', './bounds.zip')
		with zipfile.ZipFile('./bounds.zip', 'r') as zipRef:
			zipRef.extractall(data['bounds'])
		# os.remove('./bounds.zip')


	data['splitter'] = 0
	data['mkgmap'] = 0

	config.save(data)

	u.update()




if __name__ == '__main__':
	prepare()