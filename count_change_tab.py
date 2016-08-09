

FIRST_DENOMINATION = {
    1: 1,
    2: 5, 
    3: 10, 
    4: 25, 
    5: 50}

TAB = {}

def first_denomination(kinds_of_coins):
    return FIRST_DENOMINATION[kinds_of_coins]


def cc(amount, kinds_of_coins):
    if amount == 0:
        return 1
    elif amount < 0:
        return 0
    elif kinds_of_coins == 0:
        return 0
    elif (amount, kinds_of_coins) in TAB:
        return TAB[(amount, kinds_of_coins)]
    else:
        result = \
            cc(amount, kinds_of_coins - 1) + \
            cc(amount - first_denomination(kinds_of_coins), kinds_of_coins)
        TAB[(amount, kinds_of_coins)] = result
        return result


def count_change(amount):
    return cc(amount, 5)


print count_change(500)
