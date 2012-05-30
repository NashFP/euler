"""
Solution using a generator.

>>> f = fibgen(1000000)
>>> sum([n for n in f if even_p(n)])
1089154

"""

import doctest

def even_p(n):
    return n % 2 == 0

def fibgen(limit):
    a, b = 0, 1
    while b < limit:
        yield b
        a, b = b, a+b

if __name__ == "__main__":
    doctest.testmod()
