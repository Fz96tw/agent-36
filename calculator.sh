#!/bin/bash

compute() {
  local operand1=$1
  local operator=$2
  local operand2=$3
  local result

  # Validate operands
  if ! [[ "$operand1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$operand2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Invalid operands"
    return 1
  fi

  case "$operator" in
    +) result=$(echo "$operand1 + $operand2" | bc) ;; 
    -) result=$(echo "$operand1 - $operand2" | bc) ;; 
    \*) result=$(echo "$operand1 * $operand2" | bc) ;; 
    /)
      if [[ "$operand2" == 0 ]]; then
        echo "Error: Division by zero"
        return 2
      fi
      result=$(echo "scale=2; $operand1 / $operand2" | bc) ;; 
    *)
      echo "Error: Invalid operator"
      return 3
      ;;
  esac

  echo "$result"
}

# Main script logic (example usage)
if [ $# -ne 3 ]; then
  echo "Usage: $0 operand1 operator operand2"
  exit 1
fi

result=$(compute "$1" "$2" "$3")
echo "Result: $result"