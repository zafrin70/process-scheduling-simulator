#!/bin/bash
# Shows a short help/usage screen.

show_help() {
    echo ""
    echo -e "${BOLD}${BLUE}CPU Scheduling Simulator - Help${RESET}"
    echo ""
    echo "This program simulates common CPU scheduling algorithms:"
    echo "  1) FCFS         - First Come First Served"
    echo "  2) SJF          - Shortest Job First (non-preemptive)"
    echo "  3) Priority     - Priority Scheduling (lower number = higher priority)"
    echo "  4) Round Robin  - Time-slice based scheduling"
    echo "  5) Compare All  - Runs every algorithm on the same input and compares them"
    echo ""
    echo "For each process you will be asked for:"
    echo "  - Arrival Time : when the process enters the ready queue"
    echo "  - Burst Time   : how long the process needs the CPU"
    echo "  - Priority     : only asked for Priority Scheduling / Compare All"
    echo ""
    echo "After an algorithm runs, you can:"
    echo "  - View a simple Gantt chart of the CPU schedule"
    echo "  - Save the results table to a text file"
    echo ""
}
