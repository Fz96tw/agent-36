#!/bin/bash

parse_input() {
  if [ "$#" -ne 3 ]; then
    echo "Usage: $0 operand1 operator operand2"
    exit 1
  fi
  
  operand1=$1
  operator=$2
  operand2=$3
  
  is_number() {
    [[ $1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]
  }

  if ! is_number "$operand1" || ! is_number "$operand2"; then
    echo "Error: Both operands must be valid numbers."
    exit 2
  fi
  
  if [[ ! "$operator" =~ ^[\+\-\*/]$ ]]; then
    echo "Error: Invalid operator: $operator. Valid operators are +, -, *, /."; 
    exit 3
  fi
  
  return 0 # Optional; success is implied
}

# Call the function to validate input
parse_input "$@"
