#!/bin/bash
# Saves the current results table to a text file chosen by the user.

save_output() {
    local n=$1
    local algo_name=$2
    local filename

    read -p "Enter filename to save (e.g. result.txt): " filename

    {
        echo "===== $algo_name Results ====="
        printf "%-6s %-10s %-8s %-12s %-8s %-8s\n" "PID" "Arrival" "Burst" "Completion" "TAT" "Waiting"
        echo "--------------------------------------------------------"
        for ((i=0; i<n; i++))
        do
            printf "%-6s %-10s %-8s %-12s %-8s %-8s\n" \
                "${pid[$i]}" "${arrival[$i]}" "${burst[$i]}" \
                "${completion[$i]}" "${tat[$i]}" "${waiting[$i]}"
        done
        echo "--------------------------------------------------------"
        echo "Average Waiting Time    : $avg_waiting"
        echo "Average Turnaround Time : $avg_turnaround"
    } > "$filename"

    echo -e "${GREEN}Results saved to $filename${RESET}"
}
