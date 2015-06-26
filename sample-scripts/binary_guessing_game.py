import math
import random

TOPNUM = 50
number = random.randint(0,TOPNUM)
guesses = 0
current_guess = -1

while True:
	current_guess = input("Guess a number between 1 and " + str(TOPNUM))
	current_guess_int = int(current_guess)
	guesses +=1
	if current_guess_int > number: 
		print "Too high!"
	elif current_guess_int < number:
		print "Too low!"
	else: 
		print "Congratuations! You got it in " + str(guesses)+ "!"	
		break