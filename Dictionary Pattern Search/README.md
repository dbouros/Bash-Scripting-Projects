# Dictionary Pattern Search

## Overview
The **Dictionary Pattern Search** project is a Bash script and C program combination designed to search for specific word patterns within a dictionary file. The script automates the process of generating various word patterns-combinations, and checking these combinations against a dictionary. The results are stored in separate files for further analysis.

## Features
- **Automated Directory Setup:** The script automatically creates a results directory on the Desktop to store output files.
- **Word Combination Generation:** The script generates various word combinations from predefined sets.
- **Pattern Search:** Each combination is checked against the dictionary using the compiled C program.
- **Result Storage:** Results are stored in individual text files, allowing for easy examination of both empty and non-empty files.
- **Summary Report:** The script provides a summary of the number of files generated, and how many of them are empty or contain data.

## Prerequisites

### 1. System Requirements
- **Operating System:** Linux
- **Compiler:** GCC (for compiling the C program)

### 2. Project Files
Before running the project, ensure that the following files are present on the Desktop:
- `word_search.c`: The C program responsible for searching word patterns in the dictionary.
- `dictionary.txt`: The dictionary file against which the word patterns will be checked.
- `DictionaryPatternSearch.sh`: The Bash script that automates the process.

### 3. Compilation
Ensure that GCC is installed on your system. The script will automatically compile the C program (`word_search.c`) into an executable.

## Running the Project

### 1. Preparation
1. **Open the Terminal.** 

2. **Clone the Repository:**
- Clone the `Bash-Scripting-Projects` repository to your local machine and then move the `Dictionary Pattern Search` folder from the repository to your Desktop directory:

```bash
    git clone https://github.com/dbouros/Bash-Scripting-Projects.git
```

- Place the `word_search.c`, `dictionary.txt`, and `DictionaryPatternSearch.sh` files on your Desktop.

### 2. Execution
1. **Open the Terminal.** 
2. **Navigate to the Desktop:**

```bash
    cd ~/Desktop
```

3. **Make the script executable (if it's not already):**

```bash
    chmod +x DictionaryPatternSearch.sh
```

4. **Run the script:**

```bash
    ./DictionaryPatternSearch.sh dictionary.txt
```
Replace `dictionary.txt` with the name of your dictionary file if it differs.

### 3. Expected Output
- The script will generate multiple text files in the `results` directory on your Desktop.
- A summary of the total number of generated files, non-empty files, and empty files will be displayed in the terminal.
