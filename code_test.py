# importing regex library
import re

# defining masterlist to store info from files
master_list = []

def collect_data(fileName, sepRegex, reorder):
	f = open("codetest_files/input_files/"+fileName, "r")
	# looping to get each line in file
	for line in f:
		# replace new line characters and split on deliminator
		newS = line.replace("\n", "").split(sepRegex)
		# create new object for each person
		newO = {
			"LastName": newS[0],
			"FirstName": newS[1],
			"Gender": "Male" if newS[reorder[0]][0] == "M" else "Female",
			"DOB": re.sub(r'-', "/", newS[reorder[1]]),
			"FavoriteColor": newS[reorder[2]]
		}
		# append to master list 
		master_list.append(newO)
	# close file after all data has been read
	f.close()
	# return master_list
	return master_list

# reading in all three files
collect_data("comma.txt", ", ", [2, 4, 3])
collect_data("pipe.txt", " | ", [3, 5, 4])
collect_data("space.txt", " ", [3, 4, 5])

# Output 1: sorted by gender (females before males) then by last name ascending
def sort_gender(to_sort_list): 
	return sorted(to_sort_list, key=lambda x: (x["Gender"], x["LastName"]))

# Output 2: sorted by birth date, ascending then by last name ascending.
def sort_dob(to_sort_list):
	return sorted(to_sort_list, key=lambda x: (x["DOB"][-4:], x["LastName"]))

# Output 3: sorted by last name, descending.
def sort_surname(to_sort_list):
	return sorted(to_sort_list, key=lambda x: x["LastName"], reverse=True)

# function to print the output nicely
def pretty_output(num, sorted_list):
	print "Output %d:" % num
	for obj in sorted_list: 
		print obj["LastName"], obj["FirstName"], obj["Gender"], obj["DOB"], obj["FavoriteColor"]
	print

# outputting answers nicely
pretty_output(1, sort_gender(master_list))
pretty_output(2, sort_dob(master_list))
pretty_output(3, sort_surname(master_list))


