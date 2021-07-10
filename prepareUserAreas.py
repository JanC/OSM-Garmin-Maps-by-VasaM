import os, json, shutil, glob
from pathlib import Path

def safe_copy(source, destination):
	if not os.path.exists(destination):
		print(f"Copying {source} to {destination}")
		shutil.copy(source, destination)

def prepareUserAreas():
	print("Preparing sample user areas")
	Path("userAreas").mkdir(exist_ok=True)
	safe_copy('userAreas.sample/myAreas.py', 'userAreas/myAreas.py')

	with open('gmapmaker.config') as configFile:
		data = json.load(configFile)
		polygons = data['polygons']

		Path(polygons).mkdir(parents=True, exist_ok=True)
		samples = glob.glob('polygons.sample/*.geojson')
		for sample in samples:
			safe_copy(sample, f"{polygons}/{os.path.basename(sample)}")


if __name__ == '__main__':
	prepareUserAreas()