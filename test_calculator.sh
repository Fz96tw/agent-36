#!/bin/bash

run_calculator() {
    ./calculator.sh "$@"
}

check_result() {
    if [ "$1" == "$2" ]; then
        echo "Test passed: $3"
    else
        echo "Test failed: $3 (Expected: $2, Got: $1)"
    fi
}

# Unit Tests for Valid Inputs
result=$(run_calculator 3 + 2)
check_result "$result" "5" "Addition test"

result=$(run_calculator 5 - 2)
check_result "$result" "3" "Subtraction test"

result=$(run_calculator 4 '*' 2)
check_result "$result" "8" "Multiplication test"

result=$(run_calculator 10 / 2)
check_result "$result" "5" "Division test"

# Edge Cases
result=$(run_calculator 10 / 0)
check_result "$result" "Error: Division by zero" "Division by zero test"

result=$(run_calculator 10 ^ 2)
check_result "$result" "Invalid operator: ^" "Invalid operator test"

result=$(run_calculator not_a_number + 2)
check_result "$result" "Invalid number input" "Invalid number test"

# Test Logging Functionality
run_calculator 5 + 3
log_entry="5 + 3 = 8"
if grep -q "$log_entry" history.txt; then
    echo "Logging test passed: $log_entry found in history.txt"
else
    echo "Logging test failed: $log_entry not found in history.txt"
fi

# Cleanup
> history.txt
