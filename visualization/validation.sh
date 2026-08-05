#!/bin/bash
# Input validation helper functions.
# These keep asking the user until a valid value is entered.

# Check if a value is a positive whole number (1, 2, 3, ...)
is_positive_integer() {
    local value=$1
    if [[ $value =~ ^[0-9]+$ ]] && (( value > 0 )); then
        return 0
    else
        return 1
    fi
}

# Check if a value is a non-negative whole number (0, 1, 2, ...)
is_non_negative_integer() {
    local value=$1
    if [[ $value =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Ask for the number of processes
read_num_processes() {
    local n
    while true
    do
        read -p "Enter number of processes: " n
        if is_positive_integer "$n"
        then
            echo "$n"
            return 0
        else
            echo -e "${RED}Invalid input. Please enter a positive number.${RESET}" >&2
        fi
    done
}

# Ask for a non-negative number using a custom prompt
# Used for Arrival Time, Burst Time, and Priority
read_non_negative_value() {
    local prompt=$1
    local value
    while true
    do
        read -p "$prompt" value
        if is_non_negative_integer "$value"
        then
            echo "$value"
            return 0
        else
            echo -e "${RED}Invalid input. Please enter a number 0 or greater.${RESET}" >&2
        fi
    done
}

# Ask for the time quantum used in Round Robin (must be positive)
read_quantum() {
    local q
    while true
    do
        read -p "Enter time quantum: " q
        if is_positive_integer "$q"
        then
            echo "$q"
            return 0
        else
            echo -e "${RED}Invalid input. Time quantum must be a positive number.${RESET}" >&2
        fi
    done
}
