# Installation and Usage Documentation for Simple Calculator Bash Script

## Installation Steps
1. **Prerequisites**:
   - Ensure you have a Unix-like operating system (Linux, macOS).
   - Ensure that `bash` and `bc` (an arbitrary precision calculator language) are installed on your system. Most Unix-like systems come with these pre-installed.

2. **Download the Script**:
   - Open a terminal.
   - Create a directory for the calculator (optional):
     ```bash
     mkdir simple_calculator
     cd simple_calculator
     ```
   - Create a new file named `calculator.sh`:
     ```bash
     touch calculator.sh
     ```
   - Open `calculator.sh` in your favorite text editor and copy the provided code snippet into it.

3. **Make the Script Executable**:
   - Change the permissions of the script to make it executable:
     ```bash
     chmod +x calculator.sh
     ```

4. **Verify the Installation**:
   - Run the script with no arguments to check if it displays usage instructions correctly:
     ```bash
     ./calculator.sh
     ```

## Usage Instructions
1. **Basic Command Structure**:
   - The script is executed with three command line arguments: two operands and one operator.
   - **Format**:
     ```bash
     ./calculator.sh operand1 operator operand2
     ```

2. **Operands and Operators**:
   - Valid operands: Any numeric values (integers or decimals).
   - Valid operators: `+`, `-`, `*`, `/`.

3. **Logging**:
   - Each operation will be logged into `history.txt` in the same directory as the script after execution.

## Examples
1. **Addition**:
   ```bash
   ./calculator.sh 5 + 3
   ```
   Output:
   ```
   5 + 3 = 8
   ```

2. **Subtraction**:
   ```bash
   ./calculator.sh 10 - 4
   ```
   Output:
   ```
   10 - 4 = 6
   ```

3. **Multiplication**:
   ```bash
   ./calculator.sh 7 * 2
   ```
   Output:
   ```
   7 * 2 = 14
   ```

4. **Division**:
   ```bash
   ./calculator.sh 10 / 2
   ```
   Output:
   ```
   10 / 2 = 5
   ```

5. **Division by Zero**:
   ```bash
   ./calculator.sh 10 / 0
   ```
   Output:
   ```
   Error: Division by zero
   ```

6. **Invalid Operator**:
   ```bash
   ./calculator.sh 5 % 2
   ```
   Output:
   ```
   Invalid operator: %
   ```

7. **View Operation History**:
   - Check the `history.txt` file to view all logged operations:
   ```bash
   cat history.txt
   ```

By following these steps, users can successfully install and utilize the simple calculator bash script for basic arithmetic operations.