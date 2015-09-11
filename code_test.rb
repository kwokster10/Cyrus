# Write a program that builds a master list of people from three data files, then prints it to console, sorted in three different ways.

master_list = []

# the not so DRY way

# # LastName | FirstName | MiddleInitial | Gender | FavoriteColor | DateOfBirth
# File.foreach("codetest_files/input_files/pipe.txt") do |x|
# 	# newArray << x.split("\n") 
# 	newS = x.gsub(/\n/, "").split("\s|\s") # sub exact match of |\s in regex
# 	newO = {
# 		"LastName": newS[0],
# 		"FirstName": newS[1],
# 		"Gender": newS[3][0] == "M" ? "Male" : "Female",
# 		"DOB": newS[5].gsub(/-/, "/"),
# 		"FavoriteColor": newS[4]
# 	}
# 	master_list << newO
# end

# # LastName, FirstName, Gender, FavoriteColor, DateOfBirth
# File.foreach("codetest_files/input_files/comma.txt") do |x|
# 	# newArray << x.split("\n") 
# 	newS = x.gsub(/\n/, "").split(",\s") # sub exact match of |\s in regex
# 	newO = {
# 		"LastName": newS[0],
# 		"FirstName": newS[1],
# 		"Gender": newS[2][0] == "M" ? "Male" : "Female",
# 		"DOB": newS[4].gsub(/-/, "/"),
# 		"FavoriteColor": newS[3]
# 	}
# 	master_list << newO
# end

# # LastName FirstName MiddleInitial Gender DateOfBirth FavoriteColor
# File.foreach("codetest_files/input_files/space.txt") do |x|
# 	# newArray << x.split("\n") 
# 	newS = x.gsub(/\n/, "").split("\s") # sub exact match of |\s in regex
# 	newO = {
# 		"LastName": newS[0],
# 		"FirstName": newS[1],
# 		"Gender": newS[3][0] == "M" ? "Male" : "Female",
# 		"DOB": newS[4].gsub(/-/, "/"),
# 		"FavoriteColor": newS[5]
# 	}
# 	# puts newO
# 	master_list << newO
# end

# DRYer way

# where fileName is the name of the file as a string
# sepRegex is the regex needed to replace file
# reorder is array of indeces at which info appears
def read_file(master_list, fileName, sepRegex, reorder)
	# LastName FirstName Gender(Male/Female) DOB(MM/DD/YYYY) FavoriteColor
	File.foreach("codetest_files/input_files/"+fileName) do |x|
		newS = x.gsub(/\n/, "").split(sepRegex) # sub exact match of |\s in regex
		newO = {
			"LastName": newS[0],
			"FirstName": newS[1],
			"Gender": newS[reorder[0]][0] == "M" ? "Male" : "Female",
			"DOB": newS[reorder[1]].gsub(/-/, "/"),
			"FavoriteColor": newS[reorder[2]]
		}
		# puts newO
		master_list << newO
	end
	return master_list
end

# reading in each file
read_file(master_list, "pipe.txt", "\s|\s", [3, 5, 4])
read_file(master_list, "comma.txt", ",\s", [2, 4, 3])
read_file(master_list, "space.txt", "\s", [3, 4, 5])

# function to print output nice and neat
def outputting(sorted_list)
	sorted_list.each{|hash| print hash.values.join(" "), "\n"}
end

# Output 1 – sorted by gender (females before males) then by last name ascending
def sort_gender(master_list)
  # sorted_by_gender = master_list.sort_by{|hash| hash[:Gender]}
  sorted_by_gender = master_list.sort_by{|hash| [hash[:Gender], hash[:LastName]]} 
  return sorted_by_gender
end

print "Output 1:\n"
outputting(sort_gender(master_list))
print "\n"

# Output 2 – sorted by birth date, ascending then by last name ascending.
def sort_dob(master_list)
  sorted_by_birthdate = master_list.sort_by{|hash| [hash[:DOB][-4..-1], hash[:LastName]]}
  return sorted_by_birthdate
end

print "Output 2:\n"
outputting(sort_dob(master_list))
print "\n"

# Output 3 – sorted by last name, descending.
def sort_last_name(master_list)
	sorted_by_surname = master_list.sort_by{|hash| hash[:LastName]}.reverse
	return sorted_by_surname
end

print "Output 3:\n"
outputting(sort_last_name(master_list))
print "\n"

