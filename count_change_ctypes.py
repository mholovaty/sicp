import sys
import ctypes.util

_lib_name = ctypes.util.find_library('count_change')

_lib_count_change = ctypes.CDLL(_lib_name)

_count_change = _lib_count_change.count_change

_count_change.argtypes = [ctypes.c_int]

_count_change.restype = ctypes.c_int


def count_change(amount):
    return _count_change(amount)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print ("Usage: %s AMOUNT" % sys.argv[0])

        exit(1)
    
    amount = int(sys.argv[1])
    combinations = count_change(amount)

    print "Ka-ching! %d" % combinations
    exit(0)
