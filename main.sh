#!/bin/bash

# ====================================
# Process Scheduling Simulator
# Main Controller
# ====================================

# Algorithm files

source algorithms/calculation.sh
source algorithms/fcfs.sh
source algorithms/sjf.sh
source algorithms/priority.sh
source algorithms/round_robin.sh

# Visualization files

source visualization/colors.sh
source visualization/validation.sh
source visualization/display.sh
source visualization/gantt.sh
source visualization/help.sh
source visualization/save_output.sh
source visualization/compare.sh
source visualization/menu.sh

# Start the program

main_menu