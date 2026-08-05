#!/bin/bash
# Draws a simple ASCII Gantt chart from gantt_process[] and gantt_time[]
# which are filled in by each scheduling algorithm.

draw_gantt_chart() {
    echo ""
    echo -e "${BOLD}${MAGENTA}Gantt Chart:${RESET}"

    local top="+"
    local bottom="|"

    # One box per process that ran
    for p in "${gantt_process[@]}"
    do
        top+="------+"
        bottom+="  $p  |"
    done

    echo "$top"
    echo "$bottom"
    echo "$top"

    # Timeline numbers under the chart (start time, then end time of each slice)
    local line=" ${gantt_time[0]}"
    for ((i=1; i<${#gantt_time[@]}; i++))
    do
        line+="      ${gantt_time[$i]}"
    done
    echo "$line"
    echo ""
}
