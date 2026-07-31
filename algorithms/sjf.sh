#!/bin/bash


run_sjf() {

    local n=$1
# Local copies

    local at=("${arrival[@]}")
    local bt=("${burst[@]}")
    local p=("${pid[@]}")
    local pr=("${priority[@]}")

    completed=()
    completion=()

    gantt_process=()
    gantt_time=()

    current_time=0
    finished=0

    gantt_time+=($current_time)
    
    # Initialize flags

    for ((i=0;i<n;i++))
    do
        completed[$i]=0
    done

    
    # Main Loop

    while (( finished < n ))
    do

        shortest=-1
        min_burst=999999

        # Find shortest job

        for ((i=0;i<n;i++))
        do

            if (( completed[i] == 0 &&
                  at[i] <= current_time &&
                  bt[i] < min_burst ))
            then

                shortest=$i
                min_burst=${bt[i]}

            fi

        done

        # CPU idle

        if (( shortest == -1 ))
        then
            ((current_time++))
            continue
        fi
        
        # Execute job
        
        current_time=$((current_time + bt[shortest]))

        completion[$shortest]=$current_time

        completed[$shortest]=1

        ((finished++))

        gantt_process+=("${p[shortest]}")
        gantt_time+=("$current_time")

    done

    # Update arrays

    pid=("${p[@]}")
    arrival=("${at[@]}")
    burst=("${bt[@]}")
    priority=("${pr[@]}")

    # Calculate TAT and WT

    calculate_all "$n"

}