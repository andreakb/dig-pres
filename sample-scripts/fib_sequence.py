num=raw_input("What number in the Fibonacci sequence do you wish to see: ")
x=int(num)

#def fib(num_int):
#	if num_int >= 0:
#		a,b = 0,1
#   	a,b=b,a+b
#	else:
#		return fib(n)
#print (fib(num_int-1))		

# def fib(n,a=0,b=1):
# 	if n > 0:
# 		n = n -1 
# 		x = a
# 		a = b
# 		b = x + b 
# 		return fib(n,a,b)
# 	else:
# 		return a

def fib(n):
	#print "Call to f("+str(n)+")"
	if n == 0:
		return 0
	elif n == 1:
		return 1
	else:
		return fib(n-1) + fib(n-2)


print "The "+str(x)+"th fibonacci number = " + str((fib(x)))