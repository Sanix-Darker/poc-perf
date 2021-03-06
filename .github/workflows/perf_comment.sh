#!/bin/bash

_main(){
    echo "## Performances report"
    echo "Hi there, this is some performances reports for changes you made !"

    MASTER_BRANCH=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
    echo "#### On ${MASTER_BRANCH} branch"
    cat ./.benchmarks/*/0001_bench.json | jq -r '["| func     ", "| min       ", "| max       ", "| mean       ", "| median       ", "| total      ", "| iterations       ", "| full_path       |"], ["| -------", "| -------", "| -------", "| -------", "| -------", "| -------","| -------", "| ------- |"], (.benchmarks[] | ["| " + .name, "| " + (.stats.min|tostring)[0:10], "| " + (.stats.max|tostring)[0:10], "| " + (.stats.mean|tostring)[0:10], "| " + (.stats.median|tostring)[0:10], "| " + (.stats.total|tostring)[0:10], "| " + (.stats.iterations|tostring)[0:10], "| " + (.fullname[6:-1]) + "|"]) | @tsv'
    echo "#### On $1 branch"
    cat ./.benchmarks/*/0002_bench.json | jq -r '["| func     ", "| min       ", "| max       ", "| mean       ", "| median       ", "| total      ", "| iterations       ", "| full_path       |"], ["| -------", "| -------", "| -------", "| -------", "| -------", "| -------","| -------", "| ------- |"], (.benchmarks[] | ["| " + .name, "| " + (.stats.min|tostring)[0:10], "| " + (.stats.max|tostring)[0:10], "| " + (.stats.mean|tostring)[0:10], "| " + (.stats.median|tostring)[0:10], "| " + (.stats.total|tostring)[0:10], "| " + (.stats.iterations|tostring)[0:10], "| " + (.fullname[6:-1]) + "|"]) | @tsv'
}

# Where $1 is the given branch of the pull request
_main $1
