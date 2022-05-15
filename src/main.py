"""
---
"""
from math import sqrt
# from timeit import default_timer as timer


def add(val1, val2):
    """ add """
    return val1 + val2


def multiply(val1, val2):
    """ multiply """
    return val1 * val2


def power(val1, val2):
    """ power """
    return val1 ** val2


def slow_fibonacii(numm):
    """
    when the number grows... on a une complexite de O(2n)
    """
    if numm >= 0:
        if numm > 1:
            return slow_fibonacii(numm-1) + slow_fibonacii(numm-2)
        return numm
    return 0


def fast_fibonacii(numm):
    """
    Approche beaucoup plus rapide avec les racines carees et les nombres
    imaginaires !
    """
    if numm >= 0:
        return int((
            ((1 + sqrt(5)) ** numm - (1 - sqrt(5)) ** numm) /
            (2 ** numm * sqrt(5))
        ).real)

    return 0


def combined(json_dict, method, iteration=10):
    """
    just ome random combination of methods over there !
    """
    result = 0
    for nnn in range(iteration):
        for num in json_dict:
            result += method(add(method(num['a']), method(num['b'])))
            result **= method(multiply(method(num['a']), method(num['b'])))
            result ^= method(power(result, nnn))
    return result


# payload = [
#     {
#         'a': 2, 'b': 5
#     },
#     {
#         'a': 3, 'b': 6
#     }
# ]

# start = timer()
# combined(payload, slow_fibonacii, 1)
# print(f'> [slow] Executed on {timer() - start}')

# start = timer()
# combined(payload, fast_fibonacii, 1)
# print(f'> [fast] Executed on {timer() - start}')

def main_func(payload):
    """ --- """
    return combined(payload, fast_fibonacii, 1)
