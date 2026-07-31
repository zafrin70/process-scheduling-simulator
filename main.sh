#!/bin/bash


# Load algorithm files

source algorithms/calculations.sh
source algorithms/fcfs.sh
source algorithms/sjf.sh
source algorithms/priority.sh
source algorithms/round_robin.sh


run_algorithm() {

    local algorithm=$1
    local n=$2
    local quantum=$3

    case "$algorithm" in

        1)
            run_fcfs "$n"
            ;;

        2)
            run_sjf "$n"
            ;;

        3)
            run_priority "$n"
            ;;

        4)
            run_round_robin "$n" "$quantum"
            ;;

        *)
            echo "Invalid Algorithm"
            return 1
            ;;

    esac

}