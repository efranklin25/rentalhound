import pymongo
import bottle
from zipcodes import zip_codes
from bson.objectid import ObjectId


def formExpectArray(expected_array): ## takes an array of form keys as its input, and returns a sorted array back with their values.
	array = []
	for formKey in expected_array:
		value = bottle.request.forms.get(formKey)
		if value is None:
			pass
		else:
			array.append(value)

	if array == []:
		return None
	array.sort()
	return array

def check_zip(user_input): # confirming that user has supplied a valid zip code, comparing it to my zip code dictionary, if invalid I want to dismiss the zip code (Not a final solution)
	try:
		user_input = str(user_input.strip())
		if user_input in zip_codes:
			return user_input
		else: 
			return None
	except AttributeError:
		return None

def lease_query(get_value): # expecting either ANY, 1, 6, or 12 (months, 6 or 12 include less than or equal to)
	if get_value == "ANY":
		return None
	if get_value == "1" or 1:
		return 1
	if get_value == "6" or 6:
		return {'$lte' : 6}
	if get_value == "12" or 12:
		return {'$lte' : 12}
	else:
		return None

def city_query(get_value): # expecting Eugene , Springfield , Veneta , Crewell or CottageGrove
	if get_value == "CottageGrove":
		return "Cottage Grove"
	try:
		if len(get_value) <= 1:
			return None
		else:
			return get_value
	except:
		return get_value


#The Listings Data Access Object handles interactions with the listings collection
class listingsDAO:

	def __init__(self, database):
		self.db = database
		self.listings = database.listings

	def get_listing(self, permalink): # pull an individual listing using it's mongo generated object ID as a permalink
		listing = None
		try:
			cursor = self.listings.find({'_id': ObjectId(permalink)})
			for doc in cursor:
				listing = doc
		except:
			pass

		return listing

	def keep_query(self): # WIP, retain form data...
		form_data = {}

		return form_data
		
	def get_results(self): # as close to a "Model" as you can get with a non-sql DB, pass form query through function for a return of dict listing results to be displayed by template(View)
		maxCost = bottle.request.query.get("max-cost")
		minCost = bottle.request.query.get("min-cost")
		minSize = bottle.request.query.get("min-size")
		maxSize = bottle.request.query.get("max-size")

		if maxCost is '':
			maxCost = "20000"
		if minCost is '':
			minCost = "0"

		if maxSize is '':
			maxSize = "20000"
		if minSize is '':
			minSize = "0"

		if bottle.request.query.get("cats") is "1":
			cats = 1
		else:
			cats = None

		if bottle.request.query.get("dogs") is "1":
			dogs = 1
		else:
			dogs = None
		query = { 
			'cost' : {'cost' : {'$gte': int(minCost), '$lte': int(maxCost)}},
			'bath' : {'bathrooms' : {'$gte' : int(bottle.request.query.get("bath"))}},
			'bed' : {'bedrooms' : {'$gte' : int(bottle.request.query.get("bed"))}},
			'size' : {'$or' : [{'sizeSQF' : {'$gte': int(minSize), '$lte': int(maxSize)}}, {'sizeSQF' : 0}]}, 
			'cats' : {'pets.cats' : {'$lte' : cats}},
			'dogs' : {'pets.dogs' : {'$lte' : dogs}},
			'type' : {'type' : {'$in' : formExpectArray(['studio', 'apartment', 'condo', 'house']) }},
			'zip' : {'location.zip_code' : check_zip(bottle.request.query.get("zip"))},
			'lease' : {'lease' : lease_query(bottle.request.query.get("lease"))},
			'city' : {'location.city' : city_query(bottle.request.query.get("city"))}
		}

		## Default Query Values - Cancel out un-modified search paramaters so they do not get passed on to query
		DQV = {
			'cost' : {'cost' : {'$gte': 0, '$lte': 20000}},
			'bath' : {'bathrooms' : {'$gte' : 0}},
			'bed' : {'bedrooms' : {'$gte' : 0}},
			'size' : {'$or' : [{'sizeSQF' : {'$gte': 0, '$lte': 20000}}, {'sizeSQF' : 0}]},
			'cats' : {'pets.cats' : {'$lte' : None}},
			'dogs' : {'pets.dogs' : {'$lte' : None}},
			'type' : {'type' : {'$in' : None }},
			'zip' : {'location.zip_code' : None},
			'lease' : {'lease' : None},
			'city' : {'city' : None}
		}

		search = {}# initialize final dict for search parameters

		for key in query: # remove unmodified parameters from search for efficency
			if DQV[key] != query[key]:
				search[key] = query[key]

		queried_listings = [] #initialize array for returned listings, will be array of dicts, each dict being one listing

		if search == {}:
			cursor = self.listings.find().limit(20)#### TEMP LIMIT
		else:
			x = list(search.values()) #strip the search dict down to it's values to pass through pymongo's "$and" function
			cursor = self.listings.find({'$and' : x})

		for doc in cursor:
			queried_listings.append(doc)

		return queried_listings #voila! 
