# importing code
import code_test

# testing comma delimated file is read properly
def test_comma():
	code_test.master_list = []
	comma_items = code_test.collect_data("comma.txt", ", ", [2, 4, 3])
	expected_items = [
		{"LastName": "Abercrombie", 
		"FirstName": "Neil", "Gender": 
		"Male", "DOB": "2/13/1943", 
		"FavoriteColor": "Tan"}, 
		{"LastName": "Bishop", 
		"FirstName": "Timothy", 
		"Gender": "Male", 
		"DOB": "4/23/1967", 
		"FavoriteColor": "Yellow"}, 
		{"LastName": "Kelly", 
		"FirstName": "Sue", 
		"Gender": "Female", 
		"DOB": "7/12/1959", 
		"FavoriteColor": "Pink"}
	]

	assert expected_items == comma_items

# testing pipe delimated file is read properly
def test_pipe():
	code_test.master_list = []
	pipe_items = code_test.collect_data("pipe.txt", " | ", [3, 5, 4])
	expected_items = [
	{"LastName": "Smith",
		"FirstName": "Steve",
		"Gender": "Male",
		"DOB": "3/3/1985",
		"FavoriteColor": "Red"}, 
	 {"LastName": "Bonk",
		"FirstName": "Radek",
		"Gender": "Male",
		"DOB": "6/3/1975",
		"FavoriteColor": "Green"}, 
		{"LastName": "Bouillon",
		"FirstName": "Francis",
		"Gender": "Male",
		"DOB": "6/3/1975",
		"FavoriteColor": "Blue"}
	]
	
	assert expected_items == pipe_items

# testing space delimated file is read properly
def test_space():
	code_test.master_list = []
	space_items = code_test.collect_data("space.txt", " ", [3, 4, 5])
	expected_items = [
		{"LastName": "Kournikova",
			"FirstName": "Anna",
			"Gender": "Female",
			"DOB": "6/3/1975",
			"FavoriteColor": "Red"}, 
  	 {"LastName": "Hingis",
			"FirstName": "Martina",
			"Gender": "Female",
			"DOB": "4/2/1979",
			"FavoriteColor": "Green"}, 
			{"LastName": "Seles",
			"FirstName": "Monica",
			"Gender": "Female",
			"DOB": "12/2/1973",
			"FavoriteColor": "Black"}
		]
	
	assert expected_items == space_items

# test that files read in all get appended to one master list
def test_appended_to_master():
	code_test.master_list = []
	code_test.collect_data("comma.txt", ", ", [2, 4, 3])
	code_test.collect_data("pipe.txt", " | ", [3, 5, 4])
	code_test.collect_data("space.txt", " ", [3, 4, 5])

	assert len(code_test.master_list) == 9

# check list is sorted by female and then last name ascending
def test_sort_gender():
	master_list = [
	 {"LastName": "Bishop",
		"FirstName": "Timothy",
		"Gender": "Male",
		"DOB": "4/23/1967",
		"FavoriteColor": "Yellow"},
	 {"LastName": "Kournikova",
		"FirstName": "Anna",
		"Gender": "Female",
		"DOB": "6/3/1975",
		"FavoriteColor": "Red"},
	 {"LastName": "Hingis",
		"FirstName": "Martina",
		"Gender": "Female",
		"DOB": "4/2/1979",
		"FavoriteColor": "Green"}
	]

	sorted_master_list = [
		{"LastName": "Hingis",
		"FirstName": "Martina",
		"Gender": "Female",
		"DOB": "4/2/1979",
		"FavoriteColor": "Green"},
	 {"LastName": "Kournikova",
		"FirstName": "Anna",
		"Gender": "Female",
		"DOB": "6/3/1975",
		"FavoriteColor": "Red"},
		{"LastName": "Bishop",
		"FirstName": "Timothy",
		"Gender": "Male",
		"DOB": "4/23/1967",
		"FavoriteColor": "Yellow"}
	]
	assert sorted_master_list == code_test.sort_gender(master_list)

# check list is sorted by DOB and then last name ascending
def test_sort_dob():
	master_list = [
	 {"LastName": "Bouillon",
		"FirstName": "Francis",
		"Gender": "Male",
		"DOB": "6/3/1975",
		"FavoriteColor": "Blue"},
	 {"LastName": "Smith",
		"FirstName": "Steve",
		"Gender": "Male",
		"DOB": "3/3/1985",
		"FavoriteColor": "Red"}, 
	 {"LastName": "Bonk",
		"FirstName": "Radek",
		"Gender": "Male",
		"DOB": "6/3/1975",
		"FavoriteColor": "Green"}
	]
	sorted_master_list = [ 
	 {"LastName": "Bonk",
		"FirstName": "Radek",
		"Gender": "Male",
		"DOB": "6/3/1975",
		"FavoriteColor": "Green"}, 
		{"LastName": "Bouillon",
		"FirstName": "Francis",
		"Gender": "Male",
		"DOB": "6/3/1975",
		"FavoriteColor": "Blue"},
	 {"LastName": "Smith",
		"FirstName": "Steve",
		"Gender": "Male",
		"DOB": "3/3/1985",
		"FavoriteColor": "Red"}
	]
	assert sorted_master_list == code_test.sort_dob(master_list)

# check list is sorted by last name descending
def test_sort_last_name():
	master_list = [
	 {"LastName": "Bouillon",
		"FirstName": "Francis",
		"Gender": "Male",
		"DOB": "6/3/1975",
		"FavoriteColor": "Blue"},
	 {"LastName": "Smith",
		"FirstName": "Steve",
		"Gender": "Male",
		"DOB": "3/3/1985",
		"FavoriteColor": "Red"}, 
	 {"LastName": "Bonk",
		"FirstName": "Radek",
		"Gender": "Male",
		"DOB": "6/3/1975",
		"FavoriteColor": "Green"}
	]

	sorted_master_list = [
	 {"LastName": "Smith",
		"FirstName": "Steve",
		"Gender": "Male",
		"DOB": "3/3/1985",
		"FavoriteColor": "Red"},
	 {"LastName": "Bouillon",
		"FirstName": "Francis",
		"Gender": "Male",
		"DOB": "6/3/1975",
		"FavoriteColor": "Blue"},
	 {"LastName": "Bonk",
		"FirstName": "Radek",
		"Gender": "Male",
		"DOB": "6/3/1975",
		"FavoriteColor": "Green"}
	]
	assert sorted_master_list == code_test.sort_surname(master_list)

# test output is printed nicely
def test_output_format():
	sorted_master_list = [
	 {"LastName": "Smith",
		"FirstName": "Steve",
		"Gender": "Male",
		"DOB": "3/3/1985",
		"FavoriteColor": "Red"},
	 {"LastName": "Bouillon",
		"FirstName": "Francis",
		"Gender": "Male",
		"DOB": "6/3/1975",
		"FavoriteColor": "Blue"}
	]

	assert "Output 3:\nSmith Steve Male 3/3/1985 Red\nBouillon Francis Male 6/3/1975 Blue\n\n", pretty_output(3, sorted_master_list)


