import sys
import cgi
import copy
import html

from bs4 import BeautifulSoup

#your_template = open("html_form_data.html", 'r').read()
#form = form_keeper(your_template)
#form.insert()

class form_keeper():

	def __init__(self, form_template):
		self.tpl = form_template
		self.form_soup = copy.copy(BeautifulSoup(self.tpl, 'html.parser'))

	def build_form(self, query): 
		soup = copy.copy(self.form_soup) ##NOTE THIS REQUIRES BS4 VERSION 4.4 OR LATER##
		parameters = cgi.parse_qs(query)
		for key, value in parameters.items(): # For each key=value pair in query dict, parse through html form template and modify it to reflect current search parameters 
			field = soup.find("", {"name" : key})
			if field.name == "input":
				if field.type == "text" or "number" or "email" or "color" or "month" or "range" or "tel" or "url" or "week" or "date" or "datetime-local":
					#field['value'] = html.escape(str(value), quote=True) # security
					field['value'] = value
				else:
					if field.type == "checkbox" or "radio":
						field["checked"] = "True"

			if field.name == "select":
				field.find("option", {'value' : value})['selected'] = ''

		if soup.find('input', {'type' : 'checkbox'}): # Any currently checked checkboxes that are not present in query get de-checked
			for parameter in soup.find_all('input', {'type' : 'checkbox'}):
				if parameter.attrs["name"] in parameters:
					pass
				else:
					try:
						del parameter["checked"]
					except:
						pass

		if soup.find('input', {'type' : 'radio'}): # Any currently checked radio buttons that are not present in query get de-checked
			for parameter in soup.find_all('input', {'type' : 'radio'}):
				if parameter.attrs["name"] in parameters:
					pass
				else:
					try:
						del parameter["checked"]
					except:
						pass
		return soup


	def insert(self, query):
		## return default form, if query is present then set selections to query parameters
		if query == None:
			return str(self.tpl) ## default form if no query present
		else:
			return str(self.build_form(query))



	
