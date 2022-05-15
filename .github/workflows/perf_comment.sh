#!/bin/bash


_apply_jq_filter(){
    # A simeple cat of the markdown representation from given json benchmarks
    # files
    $(cat $1 | jq -r '["| func     ", "| min       ", "| max       ", "| mean       ", "| median       ", "| total      ", "| iterations       ", "| full_path |"], ["| -------", "| -------", "| -------", "| -------", "| -------", "| -------","| -------", "| ------- |"], (.benchmarks[] | ["| " + .name, "| " + (.stats.min|tostring)[0:10], "| " + (.stats.max|tostring)[0:10], "| " + (.stats.mean|tostring)[0:10], "| " + (.stats.median|tostring)[0:10], "| " + (.stats.total|tostring)[0:10], "| " + (.stats.iterations|tostring)[0:10], "| " + (.fullname[6:-1]) + "|"]) | @tsv')
}

_main(){
    echo "### On Master"
    ls -al
    _apply_jq_filter ./.benchmarks/*/0001_bench.json
    echo "### On $1"
    _apply_jq_filter ./.benchmarks/*/0002_bench.json
}

# Where $1 is the given branch of the pull request
_main $1
