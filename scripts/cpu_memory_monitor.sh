#!/usr/bin/env bash


# check for input 
if [[ $# -eq 0 ]];then
  echo "Usage: $0 <no. iterations>"
  exit 1
fi

total_cpu_usage(){
  res=$(top -bn 2 | grep "Cpu" | tail -n 1 | awk '{print 100-$8}')
  echo "CPU Usage: $res%"
}

total_ram_usage(){
  free=$(free -gh | grep "Mem:" | awk '{print $7}')
  total=$(free -gh | grep "Mem:" | awk '{print $2}') 
  echo "Memory Usage: $free out of total $total RAM."
}

for (( i=0; i<"$1"; i++));do
  total_cpu_usage
  total_ram_usage
  echo "====================================================="
done

# total = 100 - idle%
# top -b -n 2 runs top in batch mode and get the first two iterations 


