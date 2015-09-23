import cgitb
import urllib
import cgi

import pymongo
import bottle
from bottle import static_file

import listingsDAO
import form_keeper
from serverConfig import database

cgitb.enable(display=0, logdir="/")



@bottle.route('/static/<path:path>') #route for static files and css etc
def callback(path):
	return static_file(path, root='./static/')

@bottle.route('/') # index
def rh_index():
	return bottle.template('templates/index')

@bottle.route('/test') # index
def rh_index():
	return bottle.template('templates/listing')

@bottle.route('/rentals/<permalink>')
def rh_listing(permalink):
	permalink = cgi.escape(permalink)
	listing = rentals.get_listing(permalink) #use model to returning a specific listing, using object id as permalink
#	if listing is None:
#		bottle.redirect("...")

	return bottle.template('templates/listing', dict(listing=listing))


#handles a query for listings based on form data
@bottle.get('/rentals')
def rh_rentals():
	results = rentals.get_results() # pass query through model for results

	search = bottle.request.query_string

	return bottle.template('templates/rentals', dict(returned_listings=results, new_form=form.insert(search))) #pass listings to template(View)


form_template = open("templates/form_template.tpl", 'r').read()
form = form_keeper.form_keeper(form_template)
rentals = listingsDAO.listingsDAO(database)


bottle.debug(True)
bottle.run(host='localhost', port=8082)  