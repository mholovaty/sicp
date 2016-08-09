


def fib(n):
    f1 = 1
    f2 = 1
    
    if n == 1:
        return f1
    elif n == 2:
        return f2
    else:
        for i in xrange(3, n+1):
            f1, f2 = f2, f1 + f2
        return f2
