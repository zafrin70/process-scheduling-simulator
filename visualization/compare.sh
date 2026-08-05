#!/bin/bash
# Runs all four algorithms on the exact same set of processes
# and prints their average waiting/turnaround times side by side.

compare_algorithms() {
    local n=$1
    local quantum=$2

    # Keep a backup of the original input, since every algorithm
    # is allowed to sort/reorder the arrays while it runs.
    local orig_pid=("${pid[@]}")
    local orig_arrival=("${arrival[@]}")
    local orig_burst=("${burst[@]}")
    local orig_priority=("${priority[@]}")

    echo ""
    echo -e "${BOLD}${CYAN}===== Comparing All Algorithms =====${RESET}"
    printf "%-15s %-20s %-20s\n" "Algorithm" "Avg Waiting Time" "Avg Turnaround Time"
    echo "------------------------------------------------------------"

    # FCFS
    pid=("${orig_pid[@]}"); arrival=("${orig_arrival[@]}"); burst=("${orig_burst[@]}"); priority=("${orig_priority[@]}")
    run_fcfs "$n"
    printf "%-15s %-20s %-20s\n" "FCFS" "$avg_waiting" "$avg_turnaround"

    # SJF
    pid=("${orig_pid[@]}"); arrival=("${orig_arrival[@]}"); burst=("${orig_burst[@]}"); priority=("${orig_priority[@]}")
    run_sjf "$n"
    printf "%-15s %-20s %-20s\n" "SJF" "$avg_waiting" "$avg_turnaround"

    # Priority
    pid=("${orig_pid[@]}"); arrival=("${orig_arrival[@]}"); burst=("${orig_burst[@]}"); priority=("${orig_priority[@]}")
    run_priority "$n"
    printf "%-15s %-20s %-20s\n" "Priority" "$avg_waiting" "$avg_turnaround"

    # Round Robin
    pid=("${orig_pid[@]}"); arrival=("${orig_arrival[@]}"); burst=("${orig_burst[@]}"); priority=("${orig_priority[@]}")
    run_round_robin "$n" "$quantum"
    printf "%-15s %-20s %-20s\n" "Round Robin" "$avg_waiting" "$avg_turnaround"

    echo "------------------------------------------------------------"

    # Restore original arrays so the user's input isn't left scrambled
    pid=("${orig_pid[@]}"); arrival=("${orig_arrival[@]}"); burst=("${orig_burst[@]}"); priority=("${orig_priority[@]}")
}
