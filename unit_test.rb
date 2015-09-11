# requiring necessary libraries and file
require 'minitest/autorun'
require 'minitest/pride'
require './code_test.rb'
require 'stringio'

class TestCodeTest < MiniTest::Unit::TestCase

	# for files with more data, I would create smaller .txt files for tests but since they are short, I decided to keep all of the content

	# testing if pipe delimited file is in desired format 
  def test_pipe_read_file
  	master_list = []
    assert_equal [{"LastName": "Smith",
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
				"FavoriteColor": "Blue"}], read_file(master_list, "pipe.txt", "\s|\s", [3, 5, 4])
  end

	# testing if comma delimited file is in desired format 
  def test_comma_read_file
  	master_list = []
    assert_equal [{"LastName": "Abercrombie",
				"FirstName": "Neil",
				"Gender": "Male",
				"DOB": "2/13/1943",
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
				"FavoriteColor": "Pink"}], read_file(master_list, "comma.txt", ",\s", [2, 4, 3])
  end

	# testing if space delimited file is in desired format 
  def test_space_read_file
  	master_list = []
    assert_equal [{"LastName": "Kournikova",
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
				"FavoriteColor": "Black"}], read_file(master_list, "space.txt", "\s", [3, 4, 5])
  end

  # after multiple files are read, testing it's appending properly to the master list
  def test_append_master_list 
  	master_list = []
  	read_file(master_list, "space.txt", "\s", [3, 4, 5])
  	read_file(master_list, "comma.txt", ",\s", [2, 4, 3])
  	read_file(master_list, "pipe.txt", "\s|\s", [3, 5, 4])
  	assert_equal 9, master_list.length
  end

  # check list is sorted by female and then last name ascending
  def test_sort_gender
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
  	assert_equal sorted_master_list, sort_gender(master_list)
  end

  # check list is sorted by DOB and then last name ascending
  def test_sort_dob
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
  	assert_equal sorted_master_list, sort_dob(master_list)
  end

  # check list is sorted by last name descending
  def test_sort_last_name
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
  	assert_equal sorted_master_list, sort_last_name(master_list)
  end

  # check ouputting function prints in desired format
  # since it's printed to console, need to use stdout
  def setup
    @save_stdout = $stdout
    $stdout = StringIO.new
  end

  def teardown
    $stdout = @save_stdout
  end

  def test_output_format
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

    outputting(3, sorted_master_list)

  	assert_equal "Output 3:\nSmith Steve Male 3/3/1985 Red\nBouillon Francis Male 6/3/1975 Blue\n\n", $stdout.string
  end
end

