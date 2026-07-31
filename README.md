# Process Scheduling Simulator

A shell-based Process Scheduling Simulator developed using **Bash scripting** for the Operating Systems Lab course.

The simulator demonstrates the execution of common CPU scheduling algorithms and calculates their performance metrics.


## Features

- First Come First Served (FCFS)
- Shortest Job First (SJF) - Non-Preemptive
- Priority Scheduling - Non-Preemptive
- Round Robin Scheduling
- Gantt Chart
- Completion Time (CT)
- Turnaround Time (TAT)
- Waiting Time (WT)
- Average Waiting Time
- Average Turnaround Time


## Project Structure

Process-Scheduling-Simulator/

├── main.sh
├── README.md
│
├── algorithms/
│ ├── calculations.sh
│ ├── fcfs.sh
│ ├── sjf.sh
│ ├── priority.sh
│ └── round_robin.sh
│
├── visualization/
│ ├── menu.sh
│ ├── input.sh
│ ├── validation.sh
│ ├── gantt.sh
│ ├── display.sh
│ ├── compare.sh
│ ├── colors.sh
│ ├── help.sh
│ └── save_output.sh
│
└── sample_input.txt



## Scheduling Algorithms

 FCFS: Processes are executed in the order of their arrival.

 SJF: The process with the shortest burst time among the available processes is executed first.

 Priority Scheduling: The process with the highest priority (lowest priority number) is executed first.

 Round Robin: Each process receives a fixed CPU time called the **Time Quantum**. If it is not completed within the quantum, it is placed at the end of the ready queue.

---

## Performance Metrics

The simulator calculates:
 Completion Time (CT)
 
 Turnaround Time (TAT) = CT - AT

 Waiting Time (WT) = TAT - BT

 Average Waiting Time

 Average Turnaround Time


## Requirements

- Linux
- Bash Shell

---

## How to Run

  bash
bash main.sh


