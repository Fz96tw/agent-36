# AGENT-36 — Technical Design

# Technical Design for Simple Calculator Bash Script

## Overview
The objective is to develop a simple calculator implemented as a bash shell script. The script will take operands and an operator as command line arguments, perform the calculation, and log both the input and output to a history file named `history.txt` in its working folder.

## Architecture
- **Input Handling**: Accept command line arguments to collect two operands and one operator.
- **Computation Engine**: Perform arithmetic operations based on the operator passed.
- **History Logging**: Append input and result of each run to a `history.txt` file.

## Components
1. **Input Parser**
   - Handle command line arguments.
   - Validate inputs to ensure they represent numbers and valid operators. 

2. **Operations Engine**
   - Perform computation based on the operator: addition (+), subtraction (-), multiplication (*), division (/).
   - Handle division by zero errors gracefully.

3. **Logger**
   - Open `history.txt` in append mode.
   - Log each operation's input and result in the format: `operand1 operator operand2 = result`.

## Data Flow
1. **Input Handling**: Parse inputs provided from the command line.
2. **Validation**: Ensure inputs are valid numbers and operators.
3. **Computation**: Calculate the result based on inputs.
4. **Logging**: Write the operation and result to the `history.txt` file.

## Key Decisions
- Use bash for its simplicity and compatibility with command-line operations.
- The script focuses on basic error handling for invalid input types and division-specific errors.
- Store logs in `history.txt` for easy tracking of all operations performed.

## Code Snippet
```bash
#!/bin/bash
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 operand1 operator operand2"
  exit 1
fi

operand1=$1
operator=$2
operand2=$3

case "$operator" in
  +) result=$(echo "$operand1 + $operand2" | bc) ;;
  -) result=$(echo "$operand1 - $operand2" | bc) ;;
  \*) result=$(echo "$operand1 * $operand2" | bc) ;;
  /)
    if [ "$operand2" -eq 0 ]; then
      echo "Error: Division by zero"
      exit 2
    fi
    result=$(echo "scale=2; $operand1 / $operand2" | bc) ;;
  *)
    echo "Invalid operator: $operator"
    exit 3
    ;;
esac

log_entry="$operand1 $operator $operand2 = $result"
echo $log_entry >> history.txt
echo $log_entry
```
