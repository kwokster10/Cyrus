# Write a program that builds a master list of people from three data files, then prints it to console, sorted in three different ways.
masterList = []

# DRYer way

# where fileName is the name of the file as a string
# sepRegex is the regex needed to replace file
# reorder is array of indeces at which info appears
def read_file(fileName, sepRegex, reorder)
	# LastName FirstName Gender(Male/Female) DOB(MM/DD/YYYY) FavoriteColor
	File.foreach("codetest_files/input_files/"+fileName) do |x|
		newS = x.gsub(/\n/, "").split(sepRegex) # sub exact match of |\s in regex
		newO = {
			"LastName": newS[reorder[0]],
			"FirstName": newS[reorder[1]],
			"Gender": newS[reorder[2]][0] == "M" ? "Male" : "Female",
			"DOB": newS[reorder[3]].gsub(/-/, "/"),
			"FavoriteColor": newS[reorder[4]]
		}
		masterList << newO
	end
end

# the not so DRY way

# LastName | FirstName | MiddleInitial | Gender | FavoriteColor | DateOfBirth
File.foreach("codetest_files/input_files/pipe.txt") do |x|
	# newArray << x.split("\n") 
	newS = x.gsub(/\n/, "").split("\s|\s") # sub exact match of |\s in regex
	newO = {
		"LastName": newS[0],
		"FirstName": newS[1],
		"Gender": newS[3][0] == "M" ? "Male" : "Female",
		"DOB": newS[5].gsub(/-/, "/"),
		"FavoriteColor": newS[4]
	}
	masterList << newO
end

# LastName, FirstName, Gender, FavoriteColor, DateOfBirth
File.foreach("codetest_files/input_files/comma.txt") do |x|
	# newArray << x.split("\n") 
	newS = x.gsub(/\n/, "").split(",\s") # sub exact match of |\s in regex
	newO = {
		"LastName": newS[0],
		"FirstName": newS[1],
		"Gender": newS[2][0] == "M" ? "Male" : "Female",
		"DOB": newS[4].gsub(/-/, "/"),
		"FavoriteColor": newS[3]
	}
	masterList << newO
end

# LastName FirstName MiddleInitial Gender DateOfBirth FavoriteColor
File.foreach("codetest_files/input_files/space.txt") do |x|
	# newArray << x.split("\n") 
	newS = x.gsub(/\n/, "").split("\s") # sub exact match of |\s in regex
	newO = {
		"LastName": newS[0],
		"FirstName": newS[1],
		"Gender": newS[3][0] == "M" ? "Male" : "Female",
		"DOB": newS[4].gsub(/-/, "/"),
		"FavoriteColor": newS[5]
	}
	# puts newO
	masterList << newO
end


# Output 1 – sorted by gender (females before males) then by last name ascending.

# Output 2 – sorted by birth date, ascending then by last name ascending.

# Output 3 – sorted by last name, descending.