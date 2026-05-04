#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 operand1 operator operand2"
    exit 1
fi

operand1=$1
operator=$2
operand2=$3

case $operator in
    +)
        result=$(echo "$operand1 + $operand2" | bc)
        echo "$operand1 $operator $operand2 = $result"
        echo "$operand1 $operator $operand2 = $result" >> history.txt
        ;;
    -)
        result=$(echo "$operand1 - $operand2" | bc)
        echo "$operand1 $operator $operand2 = $result"
        echo "$operand1 $operator $operand2 = $result" >> history.txt
        ;;
    *)
        echo "Error: Invalid operator. Please use +, -, *, or /"
        exit 1
        ;;
    /*)
        if [ "$operand2" -eq 0 ]; then
            echo "Error: Division by zero"
        else
            result=$(echo "scale=2; $operand1 / $operand2" | bc)
            echo "$operand1 $operator $operand2 = $result"
            echo "$operand1 $operator $operand2 = $result" >> history.txt
        fi
        ;;
 esac
