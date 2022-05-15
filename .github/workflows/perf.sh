#!/bin/bash

_pytest_bench(){
    # The main method for running tests and benchmark at the same time
    # after stashing stuffs and checkout on a specific branch

    git stash
    git fetch --all
    git checkout $1

    # We start running tests
    pytest tests/ -v \
        --disable-pytest-warnings \
        --benchmark-autosave \
        --benchmark-save=bench \
        --benchmark-min-rounds=3

    # if it's the first running benchmark,
    # the file will be 0001, for the master
    # if it's the second, it will be 0002
    BENCH_NUM="0002"
    if [[ "master" == *"$1"* ]]; then
        BENCH_NUM="0001"
    fi

    echo "$(cat .benchmarks/*/${BENCH_NUM}_bench.json | jq -c '.benchmarks[]' )"
}

_pytest_bench $1
