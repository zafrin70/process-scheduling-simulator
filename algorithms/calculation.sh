#!/bin/bash

calculate_tat() {

    local n=$1

    for ((i=0; i<n; i++))
    do
        tat[$i]=$(( completion[$i] - arrival[$i] ))
    done
}

# Calculate Waiting Time

calculate_wt() {

    local n=$1

    for ((i=0; i<n; i++))
    do
        waiting[$i]=$(( tat[$i] - burst[$i] ))
    done
}

# Calculate Average Waiting Time

average_waiting_time() {

    local n=$1
    local sum=0

    for ((i=0; i<n; i++))
    do
        sum=$((sum + waiting[$i]))
    done

    avg_waiting=$(awk "BEGIN {printf \"%.2f\", $sum/$n}")
}

# Calculate Average Turnaround Time
average_turnaround_time() {

    local n=$1
    local sum=0

    for ((i=0; i<n; i++))
    do
        sum=$((sum + tat[$i]))
    done

    avg_turnaround=$(awk "BEGIN {printf \"%.2f\", $sum/$n}")
}

# Execute all calculations 
calculate_all() {

    local n=$1

    calculate_tat "$n"
    calculate_wt "$n"

    average_waiting_time "$n"
    average_turnaround_time "$n"
}
