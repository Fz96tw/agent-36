## Installation and Usage Documentation for Simple Calculator Bash Script

To install and use the Simple Calculator Bash Script, follow these steps:

### Installation Steps

1. **Open Terminal**: Launch your terminal application.
2. **Create Script File**: Use a text editor to create a new file named `calculator.sh`:
    ```bash
touch calculator.sh
```
3. **Copy Script Code**: Open `calculator.sh` in your chosen text editor and paste the provided bash script code into it.
4. **Make Script Executable**: Change the file permissions to make the script executable:
    ```bash
chmod +x calculator.sh
```
5. **Verify Script**: Optionally, check that the script is executable:
    ```bash
ls -l calculator.sh
```

### Usage Instructions

1. **Open Terminal**: Ensure your terminal is still open.
2. **Navigate to Script Directory**: Change to the directory where `calculator.sh` is located:
    ```bash
cd path/to/directory
```
3. **Run the Script**: Execute the script with two operands and an operator as arguments. The format is as follows:
    ```bash
./calculator.sh operand1 operator operand2
```
    - Replace `operand1` and `operand2` with numbers (e.g., `5`, `10`).
    - Replace `operator` with one of the following: `+`, `-`, `*`, or `/`.

### Example Commands

- To add two numbers:
    ```bash
./calculator.sh 5 + 3
```
    **Output**: `5 + 3 = 8` (and this will be logged in `history.txt`)

- To subtract two numbers:
    ```bash
./calculator.sh 10 - 4
```
    **Output**: `10 - 4 = 6` (and logged)

- To multiply two numbers:
    ```bash
./calculator.sh 7 * 6
```
    **Output**: `7 * 6 = 42` (and logged)

- To divide two numbers:
    ```bash
./calculator.sh 8 / 4
```
    **Output**: `8 / 4 = 2.00` (and logged)

- To handle division by zero:
    ```bash
./calculator.sh 10 / 0
```
    **Output**: `Error: Division by zero`

### Check History

To view the logged history of operations, simply open the `history.txt` file:
```bash
cat history.txt
```