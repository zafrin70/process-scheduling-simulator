#!/bin/bash

run_priority() {

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

    for ((i=0; i<n; i++))
    do
        completed[$i]=0
    done

    # Main loop

    while (( finished < n ))
    do
        selected=-1
        best_priority=999999

        # Find highest priority
        for ((i=0; i<n; i++))
        do
            if (( completed[i] == 0 && at[i] <= current_time ))
            then
            
                if (( pr[i] < best_priority ))
                then
                    best_priority=${pr[i]}
                    selected=$i

                elif (( pr[i] == best_priority ))
                then

                    if (( at[i] < at[selected] ))
                    then
                        selected=$i
                    fi
                fi
            fi
        done

        # CPU idle

        if (( selected == -1 ))
        then
            ((current_time++))
            continue
        fi

        # Execute job

        current_time=$((current_time + bt[selected]))

        completion[$selected]=$current_time

        completed[$selected]=1

        ((finished++))

        gantt_process+=("${p[selected]}")
        gantt_time+=("$current_time")

    done

    # Update arrays
    pid=("${p[@]}")
    arrival=("${at[@]}")
    burst=("${bt[@]}")
    priority=("${pr[@]}")

    # Calculate 
    calculate_all "$n"

}