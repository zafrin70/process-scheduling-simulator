#!/bin/bash
# The interactive menu that ties everything together.

# Ask the user for arrival time, burst time (and priority if needed)
# for each process. Fills the global pid/arrival/burst/priority arrays.
get_process_input() {
    local n=$1
    local need_priority=$2   # "yes" or "no"

    pid=()
    arrival=()
    burst=()
    priority=()

    for ((i=0; i<n; i++))
    do
        echo ""
        echo -e "${YELLOW}Process $((i+1)):${RESET}"
        pid[$i]="P$((i+1))"
        arrival[$i]=$(read_non_negative_value "  Arrival Time: ")
        burst[$i]=$(read_non_negative_value "  Burst Time: ")

        if [[ $need_priority == "yes" ]]
        then
            priority[$i]=$(read_non_negative_value "  Priority (lower = higher priority): ")
        else
            priority[$i]=0
        fi
    done
}

# Small submenu shown after an algorithm has run
after_run_menu() {
    local n=$1
    local algo_name=$2

    while true
    do
        echo -e "${CYAN}Options: [1] Show Gantt Chart  [2] Save Results  [3] Back to Main Menu${RESET}"
        read -p "Choose an option: " choice
        case $choice in
            1) draw_gantt_chart ;;
            2) save_output "$n" "$algo_name" ;;
            3) break ;;
            *) echo -e "${RED}Invalid choice.${RESET}" ;;
        esac
    done
}

# The main loop of the program
main_menu() {
    while true
    do
        echo ""
        echo -e "${BOLD}${BLUE}========= CPU Scheduling Simulator =========${RESET}"
        echo "1) FCFS (First Come First Served)"
        echo "2) SJF (Shortest Job First)"
        echo "3) Priority Scheduling"
        echo "4) Round Robin"
        echo "5) Compare All Algorithms"
        echo "6) Help"
        echo "7) Exit"
        echo "============================================="
        read -p "Choose an option: " option

        case $option in
            1)
                n=$(read_num_processes)
                get_process_input "$n" "no"
                run_fcfs "$n"
                display_results "$n" "FCFS"
                after_run_menu "$n" "FCFS"
                ;;
            2)
                n=$(read_num_processes)
                get_process_input "$n" "no"
                run_sjf "$n"
                display_results "$n" "SJF"
                after_run_menu "$n" "SJF"
                ;;
            3)
                n=$(read_num_processes)
                get_process_input "$n" "yes"
                run_priority "$n"
                display_results "$n" "Priority Scheduling"
                after_run_menu "$n" "Priority"
                ;;
            4)
                n=$(read_num_processes)
                get_process_input "$n" "no"
                quantum=$(read_quantum)
                run_round_robin "$n" "$quantum"
                display_results "$n" "Round Robin"
                after_run_menu "$n" "Round Robin"
                ;;
            5)
                n=$(read_num_processes)
                get_process_input "$n" "yes"
                quantum=$(read_quantum)
                compare_algorithms "$n" "$quantum"
                ;;
            6)
                show_help
                ;;
            7)
                echo -e "${GREEN}Goodbye!${RESET}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option. Please try again.${RESET}"
                ;;
        esac
    done
}
