#!/bin/bash

# Usage function
echo_usage() {
    echo "Usage: $0 operand1 operator operand2"
    exit 1
}

# Check for correct number of arguments
if [ "$#" -ne 3 ]; then
    echo_usage
fi

# Validate operand types
if ! [[ $1 =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ $3 =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Invalid operand(s). Both operands must be numeric."
    exit 4
fi

# Check valid operators
OPERATOR=$2
case $OPERATOR in
    +|-|\*|/)
        :
    ;;
    *)
        echo "Error: Invalid operator. Supported operators are +, -, *, /."
        exit 5
    ;;
esac

# Handle division by zero
if [ "$OPERATOR" == "/" ] && [ "$3" == "0" ]; then
    echo "Error: Division by zero is not allowed."
    exit 2
fi

# Perform calculation
case $OPERATOR in
    +)
        RESULT=$(echo "$1 + $3" | bc)
    ;;
    -)
        RESULT=$(echo "$1 - $3" | bc)
    ;;
    \*)
        RESULT=$(echo "$1 * $3" | bc)
    ;;
    /)
        RESULT=$(echo "$1 / $3" | bc)
    ;;
    *)
        echo "Unknown error occurred."
        exit 6
    ;;
esac

# Log the result
echo "Result: $RESULT"
echo "${1} ${OPERATOR} ${3} = ${RESULT}" >> history.txt
