def if_unspecified(int_value):
	if int_value == 0:
		return "Unspecified"
	else:
		return int_value

def carousel_images(img_link_array): 
	indicators = '<li data-target="#listing-carousel" data-slide-to="0" class="active"></li>'
	images = '<div class="item active"><img class="img-carousel" src="' + img_link_array[0] + '"></div>'
	count = 1

	for link in img_link_array[1:]:
		images = images + '<div class="item"><img class="img-carousel" src="' + str(link) + '"></div>'
		indicators = indicators + '<li data-target="#listing-carousel" data-slide-to="' + str(count) + '"></li>'
		count = count + 1

	output = {
		'indicators' : indicators,
		'images' : images,
	}
	return output 

def small_pictures(img_link_array, how_many, _class, attrs_dict): 
	limit = int(how_many) + 1
	output = ""
	properties = ""
	attrs = ""
	for key, value in attrs_dict:
		attrs = attrs + key + "='" + value + "' "
	first = "<div class='pure-u-1-4'><img " + attrs + "class=" + str(_class) + " src="
	second = "></div>"
	if len(img_link_array) >= 1:
		for link in img_link_array[1:limit]:
			output = output + first + link + second
	return output

def keep_drop(int_selection): # takes an integery value(or not) and returns an html drop down menu with the int selected.  (Values 1+, 2+ etc...)
	if int_selection is None:
		int_selction = 0
	if int_selection is not int:
		int(int_selection)
	drop = {0: '<option value="0">0 +</option>', 1: '<option value="1">1 +</option>', 2: '<option value="2">2 +</option>', 3: '<option value="3">3 +</option>', 4: '<option value="4">4 +</option>', 5: '<option value="5">5 +</option>', 6: '<option value="6">6 +</option>', 7: '<option value="7">7 +</option>'}
	insert = drop[int_selection][:17] + ' selected' + drop[int_selection][17:]
	drop[int_selection] = insert
	drop_list = ""
	for value in drop:
		drop_list = drop_list + drop[value]
	return drop_list

def keep_value(query_value): # Takes a value and returnes html 'value="VALUE"' of that value, OR if None or 0 will return nothing
	if query_value == None or 0 or "0":
		return
	else:
		return ' value="' + str(query_value) + '"'

def keep_check_value(query_value):
	if query_value is None or 0 or "0":
		return ' checked="False"'
	else:
		return ' checked="True"'

def print_pet(pet_dict): #dict should come accross as x = {'cats':0, 'dogs':1} etc, where 0 = unspecified, 1 = yes, 2 = no, must place literal "!" to eval this in tpl
	guide = {0:"Unspecified", 1:"Okay", 2:"Not Allowed"}
	return "Dogs are: " + guide[pet_dict["dogs"]] + "<br>" + "Cats are: " + guide[pet_dict["cats"]]

def print_lease(lease_int):
	if lease_int is not int:
		lease_int = int(lease_int)
	if lease_int <= 1:
		guide = {0:"Unspecified", 1:"Month to Month"}
		return guide[lease_int]
	else:
		lease_int = str(lease_int)
		return lease_int + " Month Lease"

def print_amenities(amen_list): #takes amenity list and prints it into one or two columns of 5 within an existing HTML table
	## must place a "!" before using in tpl to eval as literal
	TD = "<td>"
	eTD = "</td>"
	UL = "<ul>"
	eUL = "</ul>"
	LI = "<li>"
	eLI = "</li>"
	if len(amen_list) <= 5:
		the_string = ""
		for amenity in amen_list[:5]:
			the_string = LI + amenity + eLI + the_string
		the_string = TD + UL + the_string + eUL + eTD
		return the_string
	else:
		first_string = ""
		second_string = ""
		for amenity in amen_list[:5]:
			first_string = LI + amenity + eLI + first_string
		first_string = TD + UL + first_string + eUL + eTD
		for amenity in amen_list[6:10]:
			second_string = LI + amenity + eLI + second_string
		second_string = TD + UL + second_string + eUL + eTD
		return first_string + second_string

def print_secDeposit(deposit_int):
	if deposit_int == 0:
		return "Unspecified"
	else:
		return "$" + str(deposit_int)

def print_side_images(image_list): ## 
	
	rest = ""
	string = ""
	for image in image_list[:4]:
		string = '<img class="side" src="' + image + '""><br>' + string
	string = '<td class="right">' + string + '</td> </tr>'
	if len(image_list) <= 4:
		return string
	else:
		for image in image_list[5:]:
			rest = '<img class="more" src="' + image + '"> ' + rest
		rest = string + '<tr>' + '<td class="rest" colspan="2">' + rest + '</td' + '</tr>'
		return rest

def print_apply(apply_now):
	if len(apply_now) > 0:
		return '<form action="' + apply_now + '" target="_blank"> <input type="submit" value="Apply Now!"> </form>'
	else:
		return '{{listing["contact"]["name"]}}<br>{{listing["contact"]["phone"]}}<br>{{listing["contact"]["fax"]}}<br>{{listing["contact"]["email"]}}<br>{{listing["contact"]["address"]}}<br>{{listing["contact"]["hours"]}}<br>'


