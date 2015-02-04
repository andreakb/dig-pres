#!/usr/bin/env python

# tool for comparing two md5deep-ish text files of checksums 


import mmap



	
def main():
	print "Please enter the full name of the first checksum file including the .txt extension"
	fileinput1 = raw_input("> ")
	print "Now enter the full name of the checksum file you want to check against, including the .txt extentsion"
	fileinput2 = raw_input("> ")
	print "What is the length in digits of the protocol are you using? If you're not sure, enter more info."
	checksum = raw_input("> ")
	if checksum == "more info":
		print "md5 is 32, sha1 is 40, crc3 is 8 and sha256 is 64"
		checksum = raw_input("Enter the appropriate length > ")
	checklen = int(checksum)
	file1 = open(fileinput1) 
	file2 = open(fileinput2)
	file3 = open("output.txt","w")
	
	mm1 = mmap.mmap(file1.fileno(), 0, access=mmap.ACCESS_READ) #mapping both input files so they're searchable
	mm2 = mmap.mmap(file2.fileno(), 0, access=mmap.ACCESS_READ)
	
	checksumcheck(file1,fileinput2,mm2,checklen,file3) #running check of file 1 against file 2

	checksumcheck(file2,fileinput1,mm1,checklen,file3) # running check of file 2 against file 1
	print "Your results are in a file called output.txt"


		# search file2 for checksum1
		#if true, pass
		#if false, write
	#print y



def checksumcheck(f1,f2,mm,checklen,file3):
	#fuction that pulls out the checksums from one file and searches them against the other file
	
	for line in iter(f1):
		

		y = line[0:checklen] # slices string to the length of the chosen checksum protocol 
		#print y
		if mm.find(y, 0) == -1:
		
		 	file3.write("Checksum not found not found in {} {}".format(f2,line)) 
			
		else:
			pass
main()	