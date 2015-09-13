import unittest
import code_test


def test_comma():
	# hmm how to test when dictionaries in Python are unordered? loop and test in?
  assert code_test.collect_data("comma.txt", ", ", [2, 4, 3]) == [{"LastName": "Smith",
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
	"FavoriteColor": "Blue"}]