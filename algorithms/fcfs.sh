#!/bin/bash


run_fcfs() {

    local n=$1

    # Sort by Arrival Time (Bubble Sort)

    for ((i=0; i<n-1; i++))
    do
        for ((j=0; j<n-i-1; j++))
        do

            if (( arrival[j] > arrival[j+1] ))
            then

                temp=${arrival[j]}
                arrival[j]=${arrival[j+1]}
                arrival[j+1]=$temp

                temp=${burst[j]}
                burst[j]=${burst[j+1]}
                burst[j+1]=$temp

                temp=${pid[j]}
                pid[j]=${pid[j+1]}
                pid[j+1]=$temp

                temp=${priority[j]}
                priority[j]=${priority[j+1]}
                priority[j+1]=$temp

            fi
        done
    done


    # Completion Time Calculation

    current_time=0

    gantt_process=()
    gantt_time=()

    gantt_time+=($current_time)

    for ((i=0; i<n; i++))
    do

        # CPU waits if process hasn't arrived yet

        if (( current_time < arrival[i] ))
        then
            current_time=${arrival[i]}
        fi

        current_time=$(( current_time + burst[i] ))

        completion[i]=$current_time

        gantt_process+=("${pid[i]}")
        gantt_time+=("$current_time")

    done

    # Calculate TAT, WT, Averages

    calculate_all "$n"

}
