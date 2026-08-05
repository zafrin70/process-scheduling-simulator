#!/bin/bash
# Displays the process results in a neat table.

display_results() {
    local n=$1
    local algo_name=$2

    echo ""
    echo -e "${BOLD}${CYAN}===== $algo_name Results =====${RESET}"
    printf "%-6s %-10s %-8s %-12s %-8s %-8s\n" "PID" "Arrival" "Burst" "Completion" "TAT" "Waiting"
    echo "--------------------------------------------------------"

    for ((i=0; i<n; i++))
    do
        printf "%-6s %-10s %-8s %-12s %-8s %-8s\n" \
            "${pid[$i]}" "${arrival[$i]}" "${burst[$i]}" \
            "${completion[$i]}" "${tat[$i]}" "${waiting[$i]}"
    done

    echo "--------------------------------------------------------"
    echo -e "${GREEN}Average Waiting Time    : $avg_waiting${RESET}"
    echo -e "${GREEN}Average Turnaround Time : $avg_turnaround${RESET}"
    echo ""
}
