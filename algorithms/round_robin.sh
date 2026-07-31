#!/bin/bash

run_round_robin() {

    local n=$1
    local quantum=$2

    # Local copies
    local at=("${arrival[@]}")
    local bt=("${burst[@]}")
    local p=("${pid[@]}")

    # Reset output arrays
    completion=()
    gantt_process=()
    gantt_time=()

    # Queue
    queue=()
    front=0
    rear=0

    # Status arrays
    remaining=()
    visited=()


    # Initialize

    for ((i=0; i<n; i++))
    do
        remaining[$i]=${bt[$i]}
        visited[$i]=0
        completion[$i]=0
    done

    current_time=0
    finished=0

    gantt_time+=($current_time)

    # Sort by Arrival Time
    for ((i=0; i<n-1; i++))
    do
        for ((j=0; j<n-i-1; j++))
        do
            if (( at[j] > at[j+1] ))
            then
                temp=${at[j]}
                at[j]=${at[j+1]}
                at[j+1]=$temp

                temp=${bt[j]}
                bt[j]=${bt[j+1]}
                bt[j+1]=$temp

                temp=${p[j]}
                p[j]=${p[j+1]}
                p[j+1]=$temp

                temp=${remaining[j]}
                remaining[j]=${remaining[j+1]}
                remaining[j+1]=$temp
            fi
        done
    done


    # Add first arrived processes
    for ((i=0; i<n; i++))
    do
        if (( at[i] <= current_time ))
        then
            queue[$rear]=$i
            ((rear++))

            visited[$i]=1
        fi
    done


    # Main loop
    while (( finished < n ))
    do

        # CPU idle
        if (( front == rear ))
        then
            ((current_time++))
            
            for ((i=0; i<n; i++))
            do
                if (( visited[i] == 0 && at[i] <= current_time ))
                then
                    queue[$rear]=$i
                    ((rear++))

                    visited[$i]=1
                fi
            done
            continue
        fi

        
        # Dequeue
        index=${queue[$front]}
        ((front++))

            # Execute process
            if (( remaining[index] > quantum ))
            then

                current_time=$((current_time + quantum))
                remaining[index]=$((remaining[index] - quantum))

                gantt_process+=("${p[index]}")
                gantt_time+=("$current_time")

            else

                current_time=$((current_time + remaining[index]))
                remaining[index]=0

                completion[index]=$current_time

                ((finished++))

                gantt_process+=("${p[index]}")
                gantt_time+=("$current_time")
            fi

            # Add new arrivals
            for ((i=0; i<n; i++))
            do

                if (( visited[i] == 0 && at[i] <= current_time ))
                then

                    queue[$rear]=$i
                    ((rear++))

                    visited[$i]=1
                fi
            done

            # Requeue process
            if (( remaining[index] > 0 ))
            then

                queue[$rear]=$index
                ((rear++))
            fi
        done

            # Update arrays
            pid=("${p[@]}")
            arrival=("${at[@]}")
            burst=("${bt[@]}")

            # Calculate metrics
            calculate_all "$n"
        }