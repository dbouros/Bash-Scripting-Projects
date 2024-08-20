# Bash Scripting Projects

## Overview
The **Bash Scripting Projects** repository contains a collection of Bash scripts designed to perform various automation and file management tasks. Each project is a standalone script with specific functionality, demonstrating practical uses of Bash scripting in Linux environments.

## Projects Included

### 1. Dictionary Pattern Search
- **Description:** A script that compiles a C program designed to search for patterns in a dictionary file. The script then executes the compiled program, passing a dictionary file as an argument. The dictionary file and the C program must both be present on the Desktop.
- **Features:**
  - Compiles a C program.
  - Executes the compiled program with a specified dictionary file.
  - Designed for pattern searching in text files.
- **Usage:** This script should also be executed from the Desktop and is designed to work on Linux systems.
- **Script:** `DictionaryPatternSearch.sh`
- **Directory:** `Dictionary Pattern Search`

### 2. Recursive File Organizer
- **Description:** A script that organizes files in the Desktop directory based on their extensions. The script prompts the user to create specific folders (`bin`, `lib`, `src`, `inc`) or allows custom folder names. It then recursively moves files from the Desktop into these folders.
- **Features:**
  - Automated directory creation.
  - Recursively organizes files based on file type.
  - Handles custom folder names.
- **Usage:** This script must be executed from the Desktop and runs exclusively on Linux systems.
- **Script:** `RecursiveFileOrganizer.sh`
- **Directory:** `Recursive File Organizer`

## Prerequisites
- **Operating System:** Linux (Ubuntu, Fedora, etc.).
- **Bash:** Ensure that Bash is installed and available in your terminal.
- **GCC:** The GNU Compiler Collection is required for compiling C programs in the `Dictionary Pattern Search` project.
- **Files:**
  - The `.sh` scripts must be executed from the Desktop directory.
  - The dictionary file and the C source code file for the `Dictionary Pattern Search` project should also be on the Desktop.

## How to Use
1. **Clone the Repository:**
```bash
  git clone https://github.com/dbouros/Bash-Scripting-Projects.git
  cd Bash-Scripting-Projects
```

2. **Run a Project:**

- For the **Dictionary Pattern Search**:
```bash
  ./DictionaryPatternSearch.sh dictionary.txt
```

- For the **Recursive File Organizer**:
```bash
  ./RecursiveFileOrganizer.sh
```
```bash
  ./RecursiveFileOrganizer.sh dir1 dir2 dir3
```

3. **Follow the Prompts:**
- The scripts will prompt you for input when necessary. Follow the instructions to successfully run the scripts.

