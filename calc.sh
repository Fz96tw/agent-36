#!/bin/bash

# Simple calculator with logging mechanism

# Function to perform calculation
calculate() {
  local operand1=$1
  local operator=$2
  local operand2=$3
  local result

  # Perform the operation based on the operator
  case $operator in
    +)
      result=$((operand1 + operand2))
      ;;  
    -)
      result=$((operand1 - operand2))
      ;;  
    \\*)
      result=$((operand1 * operand2))
      ;;  
    /)
      result=$((operand1 / operand2))
      ;;  
    *)
      echo "Invalid operator"
      return
      ;;  
  esac

  # Log the operation
  log_operation "$operand1" "$operator" "$operand2" "$result"

  # Print the result
  echo "$operand1 $operator $operand2 = $result"
}

# Function to log operations to history.txt
log_operation() {
  local operand1=$1
  local operator=$2
  local operand2=$3
  local result=$4
  local log_entry="$operand1 $operator $operand2 = $result"

  # Append to the log file
  echo "$log_entry" >> history.txt
}

# Example usage
calculate 5 + 3
calculate 10 - 2
calculate 4 \\* 5
calculate 20 / 4