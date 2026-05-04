#!/bin/bash

# Simple Calculator Script with Error Handling

# Validate Number of Arguments
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 operand1 operator operand2"
  exit 1
fi

operand1="$1"
operator="$2"
operand2="$3"

# Validate Operands are Numbers
if ! [[ "$operand1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$operand2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: Operands must be valid numbers."
  exit 2
fi

# Validate the Operator
case "$operator" in
  +| -| \*| /) ;; # Valid operators
  *) 
    echo "Error: Invalid operator: $operator"
    exit 3
    ;;
esac

# Handle Division by Zero
if [ "$operator" == "/" ] && [ "$operand2" == "0" ]; then
  echo "Error: Division by zero"
  exit 4
fi

# Perform the Calculation
case "$operator" in
  +) result=$(echo "$operand1 + $operand2" | bc)
     ;; 
  -) result=$(echo "$operand1 - $operand2" | bc)
     ;; 
  \*) result=$(echo "$operand1 * $operand2" | bc)
     ;; 
  /) result=$(echo "$operand1 / $operand2" | bc)
     ;; 
esac

# Output the Result
echo "Result: $result"