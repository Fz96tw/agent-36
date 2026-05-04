#!/bin/bash

> history.txt


test_parsing() {
  output=$(./calculator.sh)  # Replace with the path to your calculator script
  [[ "$output" == "Usage: ./calculator.sh operand1 operator operand2" ]]
}

test_addition() {
  output=$(./calculator.sh 5 + 3)
  [[ "$output" == "5 + 3 = 8" ]]
}

test_subtraction() {
  output=$(./calculator.sh 5 - 3)
  [[ "$output" == "5 - 3 = 2" ]]
}

test_multiplication() {
  output=$(./calculator.sh 5 '*' 3)
  [[ "$output" == "5 * 3 = 15" ]]
}

test_division() {
  output=$(./calculator.sh 6 / 3)
  [[ "$output" == "6 / 3 = 2" ]]
}

test_division_by_zero() {
  output=$(./calculator.sh 5 / 0)
  [[ "$output" == "Error: Division by zero" ]]
}

test_logging() {
  log=$(tail -n 1 history.txt)
  [[ "$log" == "operand1 operator operand2 = result" ]]  # Adjust according to test
}

# Execute Tests

test_parsing

test_addition

test_subtraction

test_multiplication

test_division

test_division_by_zero

test_logging

echo "All tests completed!"