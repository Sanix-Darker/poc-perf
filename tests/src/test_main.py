from src.main import add, multiply, fast_fibonacii, slow_fibonacii, main_func, combined


def test_add():
    assert add(1, 2) == 3
    assert add(4, 1) == 5


def test_multiply():
    assert multiply(1, 2) == 2
    assert multiply(4, 2) == 8


def test_slow_fibonacii():
    assert slow_fibonacii(10) == 55
    assert slow_fibonacii(0) == 0
    assert slow_fibonacii(1) == 1


def test_fast_fibonacii():
    assert fast_fibonacii(10) == 55
    assert fast_fibonacii(0) == 0
    assert fast_fibonacii(1) == 1


def test_combined():
    assert combined(
        [{'a': 3, 'b': 5}], slow_fibonacii, 1
    ) == 18487763498758903017821863604872883745551547783010632046513956


def test_main_func(benchmark):
    payload = [
        {
            'a': 2, 'b': 5
        },
        {
            'a': 3, 'b': 6
        }
    ]

    benchmark(
        main_func,
        payload=payload,
    )
