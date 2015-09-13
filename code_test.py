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

print collect_data("comma.txt", ", ", [2, 4, 3])
print collect_data("pipe.txt", " | ", [3, 5, 4])
print collect_data("space.txt", " ", [3, 4, 5])





