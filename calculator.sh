#!/bin/bash

# Simple Calculator Script
# Usage: ./calculator.sh operand1 operator operand2

# Define a function to log history
log_history() {
    echo "$(date): $1" >> history.txt
}

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 operand1 operator operand2"
    exit 1
fi

operand1=$1
operator=$2
operand2=$3

# Validate operands
if ! [[ $operand1 =~ ^-?[0-9]+([.][0-9]+)?$ ]] || ! [[ $operand2 =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: operands must be numbers"
    exit 1
fi

case $operator in
    +)
        result=$(echo "$operand1 + $operand2" | bc)
        ;;  
    -)
        result=$(echo "$operand1 - $operand2" | bc)
        ;;  
    \*)
        result=$(echo "$operand1 * $operand2" | bc)
        ;;  
    /)
        if [ "$operand2" == "0" ]; then
            echo "Error: Division by zero"
            exit 1
        fi
        result=$(echo "$operand1 / $operand2" | bc)
        ;;  
    *)
        echo "Error: Invalid operator"
        exit 1
        ;;  
esac

# Output the result
echo "$operand1 $operator $operand2 = $result"

# Log the history
log_history "$operand1 $operator $operand2 = $result"