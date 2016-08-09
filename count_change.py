import sys


FIRST_DENOMINATION = {
    1: 1,
    2: 5, 
    3: 10, 
    4: 25, 
    5: 50}


def first_denomination(kinds_of_coins):
    return FIRST_DENOMINATION[kinds_of_coins]


def cc(amount, kinds_of_coins):
    if amount == 0:
        return 1
    elif amount < 0:
        return 0
    elif kinds_of_coins == 0:
        return 0
    else:
        return \
            cc(amount, kinds_of_coins - 1) + \
            cc(amount - first_denomination(kinds_of_coins), kinds_of_coins)


def count_change(amount):
    return cc(amount, 5)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print ("Usage: %s AMOUNT" % sys.argv[0])

        exit(1)
    
    amount = int(sys.argv[1])
    combinations = count_change(amount)

    print "Ka-ching! %d" % combinations
    exit(0)
