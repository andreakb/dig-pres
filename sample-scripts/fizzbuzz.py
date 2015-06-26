for n in range(1, 101):
	if n % 3 == 0 and n % 5 == 0:
		print "FizzBuzz"
	if n % 3 == 0:
		print "Fizz"
	if n % 5 == 0:
		print "Buzz"
	else:
		print n