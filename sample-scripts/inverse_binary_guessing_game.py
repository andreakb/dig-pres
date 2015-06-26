import math
import random



def play(a):
	TOPNUM = 50
	LOWNUM = 1
	guesses = 0
	current_guess = -1
	cheating = "You're cheating, you douche canoe"
	
	
	print "Pick a number between 1 and " + str(TOPNUM)
	while True:
		MIDNUM = (TOPNUM - LOWNUM)/2 + LOWNUM
		if MIDNUM == LOWNUM or MIDNUM == TOPNUM :
			print cheating
			break
		print "Is your number " + str(MIDNUM)
		current_guess = raw_input("Type 'high' if the number is too high. Type 'low' if the number is too low. Type 'correct' if the number is correct")
		guesses +=1
		if current_guess == 'high':
			TOPNUM = MIDNUM
			if MIDNUM <= LOWNUM:
				print cheating
				break
		elif current_guess == 'low':
			LOWNUM = MIDNUM
			if MIDNUM >= TOPNUM:
				print cheating
				break
		elif current_guess == 'correct':
			print "Congratuations, computer! You got it in " + str(guesses)+ "!"
			break
		else:
			print "You're obviously a fuckface who can't follow directions, dicknose"
			break
	a = raw_input("Do you want to play again? yes or no")
	if a == 'yes':
		play(a)
	if a == 'no':
		print "Goodbye!"

a = raw_input("Do you want to play a game? yes or no?")
if a == 'yes':
	play(a)
if a == 'no':
	print "Goodbye!"


				



	

		


	
		
	

	




	
		
