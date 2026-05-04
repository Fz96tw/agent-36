#!/bin/bash

# Simple Calculator
# Usage: ./calculator.sh operand1 operator operand2

if [ $# -ne 3 ]; then
    echo "Usage: $0 operand1 operator operand2"
    exit 1
fi

operand1=$1
operator=$2
operand2=$3

# Function to perform calculation
calculate() {
    result=$(echo "scale=2; $1 $2 $3" | bc)
    echo "$1 $2 $3 = $result"
    echo "$1 $2 $3 = $result" >> history.txt
}

# Check for division by zero
if [ "$operator" == "/" ] && [ "$operand2" == "0" ]; then
    echo "Error: Division by zero"
    exit 1
fi

# Validate operator
case $operator in
    +|-|\*|/)  
        calculate $operand1 $operator $operand2
        ;;  
    *)  
        echo "Invalid operator: $operator"
        exit 1
        ;;  
esac