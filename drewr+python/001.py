def multiple_p(x, f):
    return x % f == 0

print sum([i for i in xrange(0, 1000) if multiple_p(i, 3) or multiple_p(i, 5)])
