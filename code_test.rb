# Write a program that builds a master list of people from three data files, then prints it to console, sorted in three different ways.

# defining global master list
master_list = []

# where fileName is the name of the file as a string
# sepRegex is pattern used to replace file delimination
# reorder is array of indices at which info appears to acquire below desired format
# LastName FirstName Gender(Male/Female) DOB(MM/DD/YYYY) FavoriteColor
def read_file(master_list, fileName, sepRegex, reorder)
	File.foreach("codetest_files/input_files/"+fileName) do |x|
		newS = x.gsub(/\n/, "").split(sepRegex)
		newO = {
			"LastName": newS[0],
			"FirstName": newS[1],
			"Gender": newS[reorder[0]][0] == "M" ? "Male" : "Female",
			"DOB": newS[reorder[1]].gsub(/-/, "/"),
			"FavoriteColor": newS[reorder[2]]
		}
		# pushing object into master array
		master_list << newO
	end
	master_list
end

# reading in each file
read_file(master_list, "pipe.txt", "\s|\s", [3, 5, 4])
read_file(master_list, "comma.txt", ",\s", [2, 4, 3])
read_file(master_list, "space.txt", "\s", [3, 4, 5])

# function to pretty print output
def outputting(num, sorted_list)
	print "Output #{num}:\n"
	sorted_list.each{|hash| print hash.values.join(" "), "\n"}
	print "\n"
end

# Output 1 – sorted by gender (females before males) then by last name ascending
def sort_gender(master_list)
  sorted_by_gender = master_list.sort_by{|hash| [hash[:Gender], hash[:LastName]]} 
  sorted_by_gender
end

outputting(1, sort_gender(master_list))

# Output 2 – sorted by birth date, ascending then by last name ascending.
def sort_dob(master_list)
  sorted_by_birthdate = master_list.sort_by{|hash| [hash[:DOB][-4..-1], hash[:LastName]]}
  sorted_by_birthdate
end

outputting(2, sort_dob(master_list))

# Output 3 – sorted by last name, descending.
def sort_last_name(master_list)
	sorted_by_surname = master_list.sort_by{|hash| hash[:LastName]}.reverse
	sorted_by_surname
end

outputting(3, sort_last_name(master_list))

